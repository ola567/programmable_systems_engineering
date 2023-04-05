//-----------------------------------------------------
// A 4 bit up-counter with synchronous active high reset
// and with active high enable signal
// Example from www.asic-world.com
//-----------------------------------------------------
#include "systemc.h"

SC_MODULE (gray_counter) {
  sc_in_clk     clock ;      // Clock input of the design
  sc_in<bool>   reset ;      // active high, synchronous Reset input  
  sc_out<sc_uint<3> > counter_out; // 3 bit vector output of the gray's counter

  //------------Local Variables Here---------------------
  sc_uint<3>	state1 = 0;

  //------------Code Starts Here-------------------------
  // Below function implements actual counter logic
  void gray_process () {
    // At every rising edge of clock we check if reset is active    
    if (reset.read() == 1) {
      state1 = 0;
      counter_out.write(state1);    
    }     
    else {
        switch (state1) {
            case 0:
                state1 = 1;
                break;
            case 1:
                state1 = 3;
                break;
            case 2:
                state1 = 6;
                break;
            case 3:
                state1 = 2;
                break;
            case 4:
                state1 = 0;
                break;
            case 5:
                state1 = 4;
                break;
            case 6:
                state1 = 7;
                break;
            case 7:
                state1 = 5;
                break;
        }
        counter_out.write(state1);

        cout << "@" << sc_time_stamp() <<" :: Gray Counter: " << counter_out.read()<<endl;
    }
  } // End of function gray_process

  // Constructor for the counter
  // Since this counter is a positive edge trigged one,
  // We trigger the below block with respect to positive
  // edge of the clock and also when ever reset changes state
  SC_CTOR(gray_counter) {
    cout<<"Executing new"<<endl;
    SC_METHOD(gray_process);
    sensitive << reset;
    sensitive << clock.pos();
  } // End of Constructor

}; // End of Module 
