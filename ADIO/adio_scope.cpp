/********************************************************************/
/*                                                                  */
/*  file: adio_scope.c                                              */
/*                                                                  */
/* This program allows to access the resources of a ADIO-24         */
/* AMC card in a user friendly way and includes some test routines  */
/*                                                                  */
/*  Author: Markus Joos, CERN-PH                                    */
/*                                                                  */
/*  18. Jan. 11  MAJO  created                                      */
/*                                                                  */
/****************C 2011 - A nickel program worth a dime**************/


#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <stdint.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <signal.h>


#define PLX_LITTLE_ENDIAN
#define PLX_LINUX
#include "PlxApi.h"
#include "rcc_error/rcc_error.h"
#include "io_rcc/io_rcc.h"
#include "cmem_rcc/cmem_rcc.h"
#include "rcc_time_stamp/tstamp.h"
#include "ROSGetInput/get_input.h"
#include "include/adio24.h"


/*prototypes*/
int mainhelp(void);
int chk_reg(void);
int decode_reg(void);
int decode_reg_grouped(void);
int decode_adc(void);
//int filar_map(int occ);
int modify_reg(void);
void dac_direct(void);
void set_digital_out(void);
void decode_fifo(int value);
void do_dma(void);
void test_config(void);
void test_mem(void);
u_long get_virt_for_bar(u_int bar, u_int offset);
int adio_map(int occ);
int adio_unmap();

/*globals*/
static volatile T_adio_regs *adio;
static u_int shandle, offset;
static u_long sreg;


/****************/
int mainhelp(void)
/****************/
{
  printf("Call Markus Joos, 72364, 160663 if you need help\n");
  return(0);
}




/*******************/
void dac_direct(void)
/*******************/
{
  static float v1 = 0.0, v2 = 0.0;
  short d1, d2;
  u_int dac_out;

  printf("\n=============================================================\n");
  adio->aux_reg = 0; //no trigger; just take data from the direct input register
  
  printf("Enter the output voltage for channel A (-10.23 V .. + 10.23 V): ");
  v1 = getfloatd(v1);
  if (v1 < -10.24 || v1 > 10.24)
  {
    printf("Parameter is out of range\n");
    return;
  }  
  d1 = (short)(v1 / 10.24 * 0x8000);
  printf("d1 = 0x%04x\n", d1);
  
  printf("Enter the output voltage for channel B (-10.23 V .. + 10.23 V): ");
  v2 = getfloatd(v2);
  if (v2 < -10.24 || v2 > 10.24)
  {
    printf("Parameter is out of range\n");
    return;
  }

  d2 = (short)(v2 / 10.24 * 0x8000);
  printf("d2 = 0x%04x\n", d2);
  
  dac_out = (((u_short)d2) << 16) + ((u_short)d1);
  printf("Writing 0x%08x to the DAC output\n", dac_out);
    
  adio->dac_write_ba = dac_out;
  printf("=============================================================\n");
}


/************************/
void set_digital_out(void)
/************************/
{
  u_int bit_mask = 0, byte_1, byte_2, byte_3, byte_4, bmask_a, bmask_b, output_mask = 0x3ff, mask_a, mask_b;

  printf("\n=============================================================\n");
  printf("Note: The registers support 32 digital signals but only signals 23..0 are available via\n");
  printf("the front panel. The signals 31..24 are internally connected (D-input to D-output)\n\n");
  
  printf("Enter the output mask (set bit to 1 to use respective pin as output): ");
  output_mask = gethexd(output_mask);

  //Build the masks for do_write_a and do_write_b
  mask_a = ((output_mask & 0x0000ff00) << 16) | ((output_mask & 0x000000ff) << 8);
  mask_b = (output_mask & 0xff000000) | ((output_mask & 0x00ff0000) >> 8);
  printf("mask_a = 0x%08x, mask_b = 0x%08x\n", mask_a, mask_b), 

  adio->dout_invert = 0; 
  adio->hse = output_mask;
  adio->lse = output_mask;
  adio->dio_mode = 0;
  
  //Set ALL Outputs to '0':
  adio->do_write_a = mask_a;
  adio->do_write_b = mask_b;

  printf("Enter the bits to set (set bit to 1 force a <1> at the output): ");
  bit_mask = gethexd(bit_mask);
  bit_mask = bit_mask & output_mask;

  byte_1 =  bit_mask & 0x000000ff;
  byte_2 = (bit_mask & 0x0000ff00) >> 8;
  byte_3 = (bit_mask & 0x00ff0000) >> 16;
  byte_4 = (bit_mask & 0xff000000) >> 24;
  
  bmask_a = byte_2 << 24 | byte_2 << 16 | byte_1 << 8 | byte_1;
  bmask_b = byte_4 << 24 | byte_4 << 16 | byte_3 << 8 | byte_3;
  printf("bmask_a = 0x%08x, bmask_b = 0x%08x\n", bmask_a, bmask_b), 
  
  adio->do_write_a = bmask_a;
  adio->do_write_b = bmask_b;
  printf("=============================================================\n");
}


/******************/
int modify_reg(void)
/******************/
{
  u_int *ptr, offset, value;

  printf("\n=============================================================\n");
  
  printf("Enter the offset of the register (0x0..0x3fc): ");
  offset = gethexd(0);
  
  if (offset == 0x00 || offset == 0x04 || offset == 0x08 || offset == 0x0c || offset == 0x44 || offset == 0xec || offset == 0x1fc || offset > 0x3fc) 
  {
    printf("Sorry, this is a read-only register\n");
    return(-1);
  }
  
  ptr = (u_int *)((u_long)&adio->version + offset);
  value = *ptr;
  printf("The register currently contains: 0x%08x\n", value);
  
  printf("Enter the new 32-bit value: ");
  value = gethexd(value);
  *ptr = value;
  printf("=============================================================\n");
  return(0);
}


/***************/
int chk_reg(void)
/***************/
{
  T_adio_regs adioregs;
  
  printf("version     is at offset 0x%04lx\n", (u_long)&adioregs.version - (u_long)&adioregs.version);
  printf("status      is at offset 0x%04lx\n", (u_long)&adioregs.status - (u_long)&adioregs.version);
  printf("result      is at offset 0x%04lx\n", (u_long)&adioregs.result - (u_long)&adioregs.version);
  printf("dma_read[0] is at offset 0x%04lx\n", (u_long)&adioregs.dma_read[0] - (u_long)&adioregs.version);
  return(0);
}


/*******************/
int adio_map(int occ)
/*******************/
{
  u_int eret, pciaddr;

  eret = IO_Open();
  if (eret != IO_RCC_SUCCESS)
  {
    rcc_error_print(stdout, eret);
    exit(-1);
  }

  eret = IO_PCIDeviceLink(0x10b5, 0x9056, occ, &shandle);
  if (eret != IO_RCC_SUCCESS)
  {
    rcc_error_print(stdout, eret);
    exit(-1);
  }  

  eret = IO_PCIConfigReadUInt(shandle, 0x18, &pciaddr);
  if (eret != IO_RCC_SUCCESS)
  {
    rcc_error_print(stdout, eret);
    exit(-1);
  } 

  printf("BAR2: Address = 0x%08x\n", pciaddr);
  if ((pciaddr & 0x0000ffff) != 0x00000000)
  {
    printf("The content of the BAR2 register looks suspicious. Check status of ADIOS24 with lspci\n");
    exit(-1);
  }

  offset = pciaddr & 0xfff;
  pciaddr &= 0xfffff000;
  eret = IO_PCIMemMap(pciaddr, 0x1000, &sreg);
  if (eret != IO_RCC_SUCCESS)
  {
    rcc_error_print(stdout, eret);
    exit(-1);
  } 

  adio = (T_adio_regs *)(sreg + offset); 
  return(0);
}


/**************/
int adio_unmap()
/**************/
{
  u_int eret;

  eret = IO_PCIMemUnmap(sreg, 0x1000);
  if (eret != IO_RCC_SUCCESS)
    rcc_error_print(stdout, eret);

  eret = IO_PCIDeviceUnlink(shandle);
  if (eret != IO_RCC_SUCCESS)
    rcc_error_print(stdout, eret);

  eret = IO_Open();
  if (eret != IO_RCC_SUCCESS)
    rcc_error_print(stdout, eret);
  return(0);  
}


/**************************/
int decode_reg_grouped(void)
/**************************/
{
  printf("\n=============================================================\n");
  
  printf("General control and misc. registers\n");
  printf("-----------------------------------\n");
  printf(" Version                                                = 0x%08x\n", adio->version);  
  printf(" Status                                                 = 0x%08x\n", adio->status);
  printf(" FGENAB      (DDFS Frequency Generator)                 = 0x%08x\n", adio->fgenab);
  printf(" FGENCD      (Clock Divider)                            = 0x%08x\n", adio->fgencd);
  printf(" SyncOut     (External Trigger Inout / Output)          = 0x%08x\n", adio->sync_out);
  printf(" DORout      (Trigger Outout / Input, DigOut-Route)     = 0x%08x\n", adio->dor_out);
  printf(" DIVMode     (DMA-Mode, Timer Select, Interrupt Enable) = 0x%08x\n", adio->div_mode);
  printf(" EVENT                                                  = 0x%08x\n", adio->event);
  printf(" DMAMode     (DMA disable / enable)                     = 0x%08x\n", adio->dma_mode);
  printf(" Compare                                                = 0x%08x\n", adio->compare_value_next);
  printf(" ChanWrite                                              = 0x%08x\n", adio->chan_write);
  printf(" TSAct       (Current Timestamp Counter Value)          = 0x%08x\n", adio->ts_act);
  printf(" TSLast      (Last TS-Counter DMA value)                = 0x%08x\n", adio->ts_last);
  printf(" TSDelta     (Trigger condition)                        = 0x%08x\n", adio->ts_delta);
  printf(" Command                                                = 0x%08x\n", adio->command);
  printf(" Parameter                                              = 0x%08x\n", adio->parameter);

  printf("ADC registers\n");
  printf("-------------\n");
  printf(" ADCMode     (Trigger Mode ADC 0..7)                    = 0x%08x\n", adio->adc_mode);
  printf(" ADC0Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_0_corr);
  printf(" ADC1Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_1_corr);
  printf(" ADC2Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_2_corr);
  printf(" ADC3Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_3_corr);
  printf(" ADC4Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_4_corr);
  printf(" ADC5Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_5_corr);
  printf(" ADC6Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_6_corr);
  printf(" ADC7Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_7_corr);
  printf(" ADC0Act     (Current Analog input value)               = 0x%08x\n", adio->adc_0_act);
  printf(" ADC1Act     (Current Analog input value)               = 0x%08x\n", adio->adc_1_act);
  printf(" ADC2Act     (Current Analog input value)               = 0x%08x\n", adio->adc_2_act);
  printf(" ADC3Act     (Current Analog input value)               = 0x%08x\n", adio->adc_3_act);
  printf(" ADC4Act     (Current Analog input value)               = 0x%08x\n", adio->adc_4_act);
  printf(" ADC5Act     (Current Analog input value)               = 0x%08x\n", adio->adc_5_act);
  printf(" ADC6Act     (Current Analog input value)               = 0x%08x\n", adio->adc_6_act);
  printf(" ADC7Act     (Current Analog input value)               = 0x%08x\n", adio->adc_7_act);
  printf(" ADC0Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_0_last);
  printf(" ADC1Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_1_last);
  printf(" ADC2Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_2_last);
  printf(" ADC3Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_3_last);
  printf(" ADC4Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_4_last);
  printf(" ADC5Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_5_last);
  printf(" ADC6Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_6_last);
  printf(" ADC7Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_7_last);
  printf(" ADC0Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_0_delta);
  printf(" ADC1Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_1_delta);
  printf(" ADC2Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_2_delta);
  printf(" ADC3Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_3_delta);
  printf(" ADC4Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_4_delta);
  printf(" ADC5Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_5_delta);
  printf(" ADC6Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_6_delta);
  printf(" ADC7Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_7_delta);

  printf("DAC registers\n");
  printf("-------------\n");
  printf(" Auxreg      (Trigger Mode DAC A/B)                     = 0x%08x\n", adio->aux_reg);
  printf(" QDac        (Direct Read Back DAC A/B)                 = 0x%08x\n", adio->q_dac);
  printf(" DACCorr     (Gain / Offset Correction DAC A/B)         = 0x%08x\n", adio->dac_corr);
  printf(" DACWriteBA  (Write DAC)                                = 0x%08x\n", adio->dac_write_ba);
  printf(" DACADelta   (Trigger condition)                        = 0x%08x\n", adio->dac_a_delta);
  printf(" DACBDelta   (Trigger condition)                        = 0x%08x\n", adio->dac_b_delta);
  printf(" DACAAct     (Current Analog Output value)              = 0x%08x\n", adio->dac_a_act);
  printf(" DACBAct     (Current Analog Output value)              = 0x%08x\n", adio->dac_b_act);
  printf(" DACALast    (Last Analog Output DMA value)             = 0x%08x\n", adio->dac_a_last);
  printf(" DACBLast    (Last Analog Output DMA value)             = 0x%08x\n", adio->dac_b_last);

  printf("Digital in registers\n");
  printf("--------------------\n");
  printf(" DDI         (Digital Input)                            = 0x%08x\n", adio->ddi);
  printf(" DInInvert   (Digital Input Inverted)                   = 0x%08x\n", adio->din_invert);
  printf(" DInFilter   (Filter Digital Input)                     = 0x%08x\n", adio->din_filter);
  printf(" DInAAct     (Current Digital Input value)              = 0x%08x\n", adio->din_a_act);
  printf(" DInBAct     (Current Digital Input value)              = 0x%08x\n", adio->din_b_act);
  printf(" DInALast    (Last Digital Input DMA value)             = 0x%08x\n", adio->din_a_last);
  printf(" DInBLast    (Last Digital Input DMA value)             = 0x%08x\n", adio->din_b_last);
  printf(" DInAMask    (Trigger condition)                        = 0x%08x\n", adio->din_a_mask);
  printf(" DInBMask    (Trigger condition)                        = 0x%08x\n", adio->din_b_mask);

  printf("Digital out registers\n");
  printf("---------------------\n");
  printf(" DDO         (Digital Output)                           = 0x%08x\n", adio->ddo);
  printf(" DOut Invert (Digital Output Inverted)                  = 0x%08x\n", adio->dout_invert);
  printf(" HSE         (HighSide Enable)                          = 0x%08x\n", adio->hse);
  printf(" LSE         (LowSide Enable)                           = 0x%08x\n", adio->lse);
  printf(" DOWrite32   (Digital Output Mask)                      = 0x%08x\n", adio->do_write_32);
  printf(" DOWriteA    (Digital Output Mask)                      = 0x%08x\n", adio->do_write_a);
  printf(" DOWriteB    (Digital Output Mask)                      = 0x%08x\n", adio->do_write_b);
  printf(" DOutAAct    (Current Digital Output value)             = 0x%08x\n", adio->dout_a_act);
  printf(" DOutBAct    (Current Digital Output value)             = 0x%08x\n", adio->dout_b_act);
  printf(" DoutALast   (Last Digital Output DMA value)            = 0x%08x\n", adio->dout_a_last);
  printf(" DoutBLast   (Last Digital Output DMA value)            = 0x%08x\n", adio->dout_b_last);
  printf(" DOutAMask   (Trigger condition)                        = 0x%08x\n", adio->dout_a_mask);
  printf(" DOutBMask   (Trigger condition)                        = 0x%08x\n", adio->dout_b_mask);

  printf("Digital in & out registers\n");
  printf("--------------------------\n");
  printf(" DIOMode     (Trigger Mode Din/Dout)                    = 0x%08x\n", adio->dio_mode);
  printf("=============================================================\n");
  return(0);
}

/******************/
int decode_adc(void)
/******************/
{
  u_int value;
  double voltage;
  
  printf("\n=============================================================\n");
  
  printf("ADC registers\n");
  printf("-------------\n");
  value = adio->adc_0_act;
  voltage = (short)(value & 0xffff) / (double) 0x8000 * 10.24;      
  printf(" ADC0Act (Current Analog input value)  = 0x%08x:  %f Volt at time = %d\n", value , voltage, value >> 16);
  value = adio->adc_1_act;
  voltage = (short)(value & 0xffff) / (double) 0x8000 * 10.24;    
  printf(" ADC1Act (Current Analog input value)  = 0x%08x:  %f Volt at time = %d\n", value , voltage, value >> 16);
  value = adio->adc_2_act;
  voltage = (short)(value & 0xffff) / (double) 0x8000 * 10.24;    
  printf(" ADC2Act (Current Analog input value)  = 0x%08x:  %f Volt at time = %d\n", value , voltage, value >> 16);
  value = adio->adc_3_act;
  voltage = (short)(value & 0xffff) / (double) 0x8000 * 10.24;    
  printf(" ADC3Act (Current Analog input value)  = 0x%08x:  %f Volt at time = %d\n", value , voltage, value >> 16);
  value = adio->adc_4_act;
  voltage = (short)(value & 0xffff) / (double) 0x8000 * 10.24;    
  printf(" ADC4Act (Current Analog input value)  = 0x%08x:  %f Volt at time = %d\n", value , voltage, value >> 16);
  value = adio->adc_5_act;
  voltage = (short)(value & 0xffff) / (double) 0x8000 * 10.24;    
  printf(" ADC5Act (Current Analog input value)  = 0x%08x:  %f Volt at time = %d\n", value , voltage, value >> 16);
  value = adio->adc_6_act;
  voltage = (short)(value & 0xffff) / (double) 0x8000 * 10.24;    
  printf(" ADC6Act (Current Analog input value)  = 0x%08x:  %f Volt at time = %d\n", value , voltage, value >> 16);
  value = adio->adc_7_act;
  voltage = (short)(value & 0xffff) / (double) 0x8000 * 10.24;    
  printf(" ADC7Act (Current Analog input value)  = 0x%08x:  %f Volt at time = %d\n", value , voltage, value >> 16);


  printf("=============================================================\n");
  return(0);
}

#define NSAMPLES 100

int decode_adc_loop(void) {
  u_int value[NSAMPLES];
  double voltage;
  u_int i;

  for (i=0;i<NSAMPLES;++i) {
    value[i]=adio->adc_0_act;
  }
  
  for (i=0;i<NSAMPLES;++i) {
    voltage = (short)(value[i] & 0xffff) / (double) 0x8000 * 10.24;      
    printf(" ADC0Act   = 0x%08x:  %f Volt at time = %d\n", value[i] , voltage, value[i] >> 16);
  }

  return 0;
}


#define NREADS 100000

int acquire_shot (void) {
  u_int value[NREADS];
  double voltage;
  u_int i;

  printf("\nEnter file name: ");
  char fn[1000];
  char def[1000];
  strcpy(def, "try1.txt");
  getstrd(fn, def);

  FILE *fp = fopen(fn, "w");
  

  adio->fgenab = 0x8B4a;  // FGen A to 44.1 kHz
  adio->adc_mode = 0x1; // ADC0 using FGEN A
  adio->div_mode = 0x00030000; // timestamp = ms
  


  for (i=0;i<NREADS;++i) {
    value[i]=adio->adc_0_act;
  }
  
  u_int last_timestamp = 0;
  u_int timestamp;
  long timestamp_ofs = 0l;

  for (i=0;i<NREADS;++i) {
    timestamp = value[i] >> 16;

    if (timestamp == last_timestamp) continue;

    if (timestamp < last_timestamp) timestamp_ofs += 0xffff;

    
    voltage = (short)(value[i] & 0xffff) / (double) 0x8000 * 10.24;
    fprintf(fp, "%10ld %f\n", timestamp_ofs + timestamp, voltage);
    printf( "%10ld %f\n", timestamp_ofs + timestamp, voltage);
    last_timestamp = timestamp;
  }

  fclose(fp);
  return 0;
}






/*************************/
void decode_fifo(int value)
/*************************/
{
  if (value == 0)
    printf("0 to 63 data words\n");
  if (value == 1)
    printf("64 to 223 data words\n");
  if (value == 2)
    printf("224 to 254 data words\n");
  if (value == 3)
    printf("255 data words (full)\n");
}


/******************/
int decode_reg(void)
/******************/
{
  u_int data, value;

  printf("\n=============================================================\n");
  data = adio->version;
  printf("Version register (0x%08x)\n", data);
  value = data >> 28;
  if (value == 1) printf("FPGA_TYPE    = TCA_ADIO24\n");
  else            printf("FPGA_TYPE    = Undefined\n");
  value = (data >> 24) & 0xf;
  if (value == 1) printf("FPGA_VERSION = Prototype\n");
  if (value == 2) printf("FPGA_VERSION = Release 2\n");
  else            printf("FPGA_VERSION = Undefined\n");
  printf("PCB version  = 0x%02x\n", (value >> 16) & 0xff);
  value = data & 0xffff;
  if (value & 0x1)    printf("Feature <IRQ on FIFO-out> suppotred\n");
  if (value & 0x2)    printf("Feature <IRQ on compare> suppotred\n");
  if (value & 0xfffc) printf("Undocumented features suppotred\n");

 
  data = adio->status;
  printf("\nStatus register (0x%08x)\n", data);
  printf("Dout07..00 FIFO: empty = %s,  status = ", (data & 0x1)?"yes":" no");
  decode_fifo((data >> 1) & 0x3);
  printf("Dout15..08 FIFO: empty = %s,  status = ", (data & 0x8)?"yes":" no");
  decode_fifo((data >> 4) & 0x3);
  printf("Dout23..16 FIFO: empty = %s,  status = ", (data & 0x40)?"yes":" no");
  decode_fifo((data >> 7) & 0x3);
  printf("Dout31..24 FIFO: empty = %s,  status = ", (data & 0x200)?"yes":" no");
  decode_fifo((data >> 10) & 0x3);
  printf("DAC A FIFO:      empty = %s,  status = ", (data & 0x1000)?"yes":" no");
  decode_fifo((data >> 13) & 0x3);
  printf("DAC B FIFO:      empty = %s,  status = ", (data & 0x8000)?"yes":" no");
  decode_fifo((data >> 16) & 0x3);
  printf("Iterrupt 0:      %s\n", (data & 0x40000)?"active":"not active");
  printf("Iterrupt 1:      %s\n", (data & 0x80000)?"active":"not active");
  printf("Iterrupt 2:      %s\n", (data & 0x100000)?"active":"not active");
  printf("Iterrupt 3:      %s\n", (data & 0x200000)?"active":"not active");
  printf("DMA FIFO full:   %s\n", (data & 0x2000000)?"yes":"no");
  printf("DMA FIFO empty:  %s\n", (data & 0x4000000)?"yes":"no");

  
  printf("\nDDI         (Digital input)                            = 0x%08x\n", adio->ddi);
  printf("DDO         (Digital output)                           = 0x%08x\n", adio->ddo);
  printf("DIOMode     (Trigger Mode Din/Dout)                    = 0x%08x\n", adio->dio_mode);
  printf("DOut Invert (Digital output inverted)                  = 0x%08x\n", adio->dout_invert);
  printf("HSE         (HighSide Enable)                          = 0x%08x\n", adio->hse);
  printf("LSE         (LowSide Enable)                           = 0x%08x\n", adio->lse);
  printf("FGENAB      (DDFS Frequency Generator)                 = 0x%08x\n", adio->fgenab);
  printf("FGENCD      (Clock Divider)                            = 0x%08x\n", adio->fgencd);
  printf("SyncOut     (External Trigger Inout / Output)          = 0x%08x\n", adio->sync_out);
  printf("DORout      (Trigger Outout / Input, DigOur-Route)     = 0x%08x\n", adio->dor_out);
  printf("DInInvert   (Digital Input Inverted)                   = 0x%08x\n", adio->din_invert);
  printf("DInFilter   (Filter Digital Input)                     = 0x%08x\n", adio->din_filter);
  printf("ADCMode     (Trigger Mode ADC 0..7)                    = 0x%08x\n", adio->adc_mode);
  printf("DIVMode     (DMA-Mode, Timer Select, Interrupt Enable) = 0x%08x\n", adio->div_mode);
  printf("Auxreg      (Trigger Mode DAC A/B)                     = 0x%08x\n", adio->aux_reg);
  printf("QDac        (Direct Read Back DAC A/B)                 = 0x%08x\n", adio->q_dac);
  printf("DACCorr     (Gain / Offset Correction DAC A/B)         = 0x%08x\n", adio->dac_corr);
  printf("EVENT                                                  = 0x%08x\n", adio->event);
  printf("DMAMode     (DMA disable / enable)                     = 0x%08x\n", adio->dma_mode);
  printf("Compare                                                = 0x%08x\n", adio->compare_value_next);
  printf("ADC0Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_0_corr);
  printf("ADC1Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_1_corr);
  printf("ADC2Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_2_corr);
  printf("ADC3Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_3_corr);
  printf("ADC4Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_4_corr);
  printf("ADC5Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_5_corr);
  printf("ADC6Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_6_corr);
  printf("ADC7Corr    (ADC Gain and Offset)                      = 0x%08x\n", adio->adc_7_corr);
  printf("DOWrite32   (Digital Output Mask)                      = 0x%08x\n", adio->do_write_32);
  printf("DOWriteA    (Digital Output Mask)                      = 0x%08x\n", adio->do_write_a);
  printf("DOWriteB    (Digital Output Mask)                      = 0x%08x\n", adio->do_write_b);
  printf("DACWriteBA  (Write DAC)                                = 0x%08x\n", adio->dac_write_ba);
  printf("ChanWrite                                              = 0x%08x\n", adio->chan_write);
  printf("ADC0Act     (Current Analog input value)               = 0x%08x\n", adio->adc_0_act);
  printf("ADC1Act     (Current Analog input value)               = 0x%08x\n", adio->adc_1_act);
  printf("ADC2Act     (Current Analog input value)               = 0x%08x\n", adio->adc_2_act);
  printf("ADC3Act     (Current Analog input value)               = 0x%08x\n", adio->adc_3_act);
  printf("ADC4Act     (Current Analog input value)               = 0x%08x\n", adio->adc_4_act);
  printf("ADC5Act     (Current Analog input value)               = 0x%08x\n", adio->adc_5_act);
  printf("ADC6Act     (Current Analog input value)               = 0x%08x\n", adio->adc_6_act);
  printf("ADC7Act     (Current Analog input value)               = 0x%08x\n", adio->adc_7_act);
  printf("DInAAct     (Current Digital Input value)              = 0x%08x\n", adio->din_a_act);
  printf("DInBAct     (Current Digital Input value)              = 0x%08x\n", adio->din_b_act);
  printf("DOutAAct    (Current Digital Output value)             = 0x%08x\n", adio->dout_a_act);
  printf("DOutBAct    (Current Digital Output value)             = 0x%08x\n", adio->dout_b_act);
  printf("DACAAct     (Current Analog Output value)              = 0x%08x\n", adio->dac_a_act);
  printf("DACBAct     (Current Analog Output value)              = 0x%08x\n", adio->dac_b_act);
  printf("TSAct       (Current Timestamp Counter Value)          = 0x%08x\n", adio->ts_act);
  printf("ADC0Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_0_last);
  printf("ADC1Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_1_last);
  printf("ADC2Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_2_last);
  printf("ADC3Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_3_last);
  printf("ADC4Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_4_last);
  printf("ADC5Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_5_last);
  printf("ADC6Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_6_last);
  printf("ADC7Last    (Last Analog Input DMA Value)              = 0x%08x\n", adio->adc_7_last);
  printf("DInALast    (Last Digital Input DMA value)             = 0x%08x\n", adio->din_a_last);
  printf("DInBLast    (Last Digital Input DMA value)             = 0x%08x\n", adio->din_b_last);
  printf("DoutALast   (Last Digital Output DMA value)            = 0x%08x\n", adio->dout_a_last);
  printf("DoutBLast   (Last Digital Output DMA value)            = 0x%08x\n", adio->dout_b_last);
  printf("DACALast    (Last Analog Output DMA value)             = 0x%08x\n", adio->dac_a_last);
  printf("DACBLast    (Last Analog Output DMA value)             = 0x%08x\n", adio->dac_b_last);
  printf("TSLast      (Last TS-Counter DMA value)                = 0x%08x\n", adio->ts_last);
  printf("ADC0Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_0_delta);
  printf("ADC1Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_1_delta);
  printf("ADC2Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_2_delta);
  printf("ADC3Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_3_delta);
  printf("ADC4Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_4_delta);
  printf("ADC5Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_5_delta);
  printf("ADC6Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_6_delta);
  printf("ADC7Delta   (Difference value for trigger)             = 0x%08x\n", adio->adc_7_delta);
  printf("DInAMask    (Trigger condition)                        = 0x%08x\n", adio->din_a_mask);
  printf("DInBMask    (Trigger condition)                        = 0x%08x\n", adio->din_b_mask);
  printf("DOutAMask   (Trigger condition)                        = 0x%08x\n", adio->dout_a_mask);
  printf("DOutBMask   (Trigger condition)                        = 0x%08x\n", adio->dout_b_mask);
  printf("DACADelta   (Trigger condition)                        = 0x%08x\n", adio->dac_a_delta);
  printf("DACBDelta   (Trigger condition)                        = 0x%08x\n", adio->dac_b_delta);
  printf("TSDelta     (Trigger condition)                        = 0x%08x\n", adio->ts_delta);
  printf("Command                                                = 0x%08x\n", adio->command);
  printf("Parameter                                              = 0x%08x\n", adio->parameter);
  printf("=============================================================\n");
  return(0);
}


/********************/
void test_config(void)
/********************/
{
  u_int ret, loop, offset = 0, ncycles = 100, fdata, ndata;

  printf("Enter the offset: "); 
  offset = gethexd(offset);

  printf("Enter the number of reads: "); 
  ncycles = getdecd(ncycles);

  ret = IO_PCIConfigReadUInt(shandle, offset, &fdata);      
  if (ret != IO_RCC_SUCCESS)
  {
    rcc_error_print(stdout, ret);
    return; 
  } 
  printf("Register contains 0x%08x\n", fdata);
  
  for (loop = 0; loop < ncycles; loop++)
  {
    ret = IO_PCIConfigReadUInt(shandle, offset, &ndata);      
    if (ret != IO_RCC_SUCCESS)
    {
      rcc_error_print(stdout, ret);
      return; 
    } 
    if (fdata != ndata)
    {
      printf("Data flipped to 0x%08x for loop = %d\n", ndata, loop);
      return;
    }
  }
}


/*****************/
void test_mem(void)
/*****************/
{
  static u_int wdata = 0, rorw = 0, offset = 0, ncycles = 10000;
  u_int nerrors = 0, fdata, ret, loop;
  volatile u_int  *pci_ptr, pci_fdata, pci_ndata;
  
  printf("Enter the offset (max. 0x1000. recommended: 0x10): "); 
  offset = gethexd(offset);

  printf("Enter the cycle type (0=read, 1=write): "); 
  rorw = getdecd(rorw);
  
  if(rorw == 1)
  {
    printf("Enter the data to write: "); 
    wdata = gethexd(wdata);
  }
  
  printf("Enter the number of cycles: "); 
  ncycles = getdecd(ncycles);

  pci_ptr = (u_int *)(sreg + offset);

  if(rorw == 0)
  {
    pci_fdata = *pci_ptr;
    printf("MEM location contains 0x%08x\n", pci_fdata);

    for (loop = 0; loop < ncycles; loop++)
    {
      pci_ndata = *pci_ptr;
      
      if (pci_fdata != pci_ndata)
      {
	printf("Data flipped to 0x%08x for loop = %d\n", pci_ndata, loop);
        nerrors++;
	if (nerrors == 20)
	  return;
        pci_fdata = pci_ndata;
      }
    }
    ret = IO_PCIConfigReadUInt(shandle, 0x0, &fdata);      
    if (ret != IO_RCC_SUCCESS)
    {
      rcc_error_print(stdout, ret);
      return; 
    } 
    if (fdata != 0x905610b5)
      printf("DID/VID register contains 0x%08x after reads\n", fdata);
  }

  if(rorw == 1)
  {
    for (loop = 0; loop < ncycles; loop++)
      *pci_ptr = wdata;

    ret = IO_PCIConfigReadUInt(shandle, 0x0, &fdata);      
    if (ret != IO_RCC_SUCCESS)
    {
      rcc_error_print(stdout, ret);
      return; 
    } 
    if (fdata != 0x905610b5)
      printf("DID/VID register contains 0x%08x after writes\n", fdata);
  }
}


/******************************/
int main(int argc, char *argv[])
/******************************/
{
  static int fun = 1, occ = 1;
  u_int ret;
  
  if ((argc == 2) && (sscanf(argv[1], "%d", &occ) == 1)) {argc--;} else {occ = 1;}
  if (argc != 1)
  {
    printf("This is ADIO_SCOPE. \n\n");
    printf("Usage: adio_scope [ADIO-24 occurrence]\n");
    exit(0);
  }
  
  ret = ts_open(1, TS_DUMMY);
  if (ret)
    rcc_error_print(stdout, ret);
  
  adio_map(occ);
  
  printf("\n\n\nThis is ADIO_SCOPE\n");
  while(fun != 0)
  {
    printf("\n");
    printf("Select an option:\n");
    printf("  1 Print help                        2 check register offsets\n");
    printf("  3 Decode registers (sequential)     4 Decode registers (grouped)\n");
    printf("  5 Modify a register                 6 Decode ADC registers\n");
    printf("  7 Set DAC output                    8 Set digital output\n");
    printf("  9 DMA test                         12 decode ADC loop\n");
    printf("  13 acquire shot\n");
    printf(" =================================================================\n");
    printf(" 10 Test config cycles               11 Test MEM cycles\n");

    printf("  0 Quit\n");
    printf("Your choice ");
    fun = getdecd(fun);
    if (fun == 1) mainhelp();
    if (fun == 2) chk_reg();
    if (fun == 3) decode_reg();
    if (fun == 4) decode_reg_grouped();
    if (fun == 5) modify_reg();
    if (fun == 6) decode_adc();
    if (fun == 7) dac_direct();
    if (fun == 8) set_digital_out();
    //    if (fun == 9) do_dma();
    if (fun == 10) test_config();
    if (fun == 11) test_mem();
    if (fun == 12) decode_adc_loop();
    if (fun == 13) acquire_shot();
  }

  adio_unmap();
  
  ret = ts_close(TS_DUMMY);
  if (ret)
    rcc_error_print(stdout, ret);
}
