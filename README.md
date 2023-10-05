# MIPS-PIPELINED

## Five stages of MIPS pipelined implementation :
1) IF: Instruction fetch
2) ID: Instruction decode and register file read
3) EX: Execution or address calculation
4) MEM: Data memory access
5) WB: Write back

"Pipelining improves performance by increasing instruction throughput, as opposed to decreasing the execution time of an individual instruction, but instruction 
 throughput is the important metric because real programs execute billions of instructions".

All the architecture is same as single cycle but extra components added in datapath are listed below.
- 4 pipeline registers to pass on the information calculated in previous stage.
- comparator and adder in ID stage to reduce the number of stall cycles to 1 in case of branch instructions.
- Hazard detection unit in ID stage to detect load word hazard.
- Forwarding unit in EX stage to reduce unnecessary stall cycles.
- some small components like mux etc.

### Pipeline Hazards
There are situations in pipelining when the next instruction cannot execute in the  following clock cycle. These events are called hazards, and there are three 
different types.

1) structural hazard.
2) data hazard.
3) control hazard.

### structural hazard
- The first hazard is called a structural hazard. It means that the hardware cannot support the combination of instructions that we want to execute in the same clock 
  cycle. 
- structural hazard When a planned instruction cannot execute in the proper clock cycle because the hardware does not  support the combination  of instructions 
  that are set to execute.
- Separate instruction and data memory is solution for structural hazard encountered in memory access.
 
### data hazard
- Data hazards occur when the pipeline must be stalled because one step must wait  for another  to complete.
- In a computer pipeline, data hazards arise from the dependence of one  instruction on an earlier one that is still in the pipeline.For example, suppose we have an     add instruction  followed immediately by a subtract instruction that uses the sum ($s0):
#####                                                      add $s0, $t0, $t1 
#####                                                      sub $t2, $s0, $t3 

- Without intervention, a data hazard could severely stall the pipeline. The add instruction doesn’t write its result until the fifth stage, meaning that we would have   to waste three clock cycles in the pipeline.
- The primary solution is based on the observation that we don’t need to wait for the instruction to complete before trying to resolve the data hazard. For the code     sequence above, as soon as the ALU creates the sum for the add, we can supply it as an input for the subtract. Adding extra hardware to retrieve the missing item       early from the internal resources is called forwarding or bypassing.
- In this graphical representation of events, forwarding paths are valid only if the destination stage is later in time than the source stage. For example, there         cannot be a valid forwarding path from the output of the memory access stage in the first  instruction to the input of the execution stage of the following, since     that would mean going backward in time.

     ![App Screenshot](https://github.com/bhim4078652/MIPS_32_PIPELINED/blob/main/IMAGE_REQ/p1.jpg)

- load-use data hazard : A specific form of data hazard in which the data being loaded by a load instruction has not yet become available when it is needed by another 
  instruction.
- In this case we cannot avoid stalls using forwarding.

     ![App Screenshot](https://github.com/bhim4078652/MIPS_32_PIPELINED/blob/main/IMAGE_REQ/p2.jpg)

### control hazard
- control hazard Also called branch hazard. When the proper instruction cannot execute in the proper pipeline clock cycle because the instruction that was fetched is     not the one that is needed; that is, the flow of instruction addresses is not what the pipeline expected.
- decision task in a computer is the branch instruction. Notice that we must begin fetching the instruction following the branch on the very next clock cycle.           Nevertheless, the pipeline cannot possibly know what the next instruction should be, since it only just received the branch instruction from memory, one possible       solution is to stall immediately after we fetch a branch, waiting until the pipeline determines the outcome of the branch and knows what instruction address to         fetch from.

- Longer pipelines can’t determine branch outcome early
        – Stall penalty becomes unacceptable
- Predict outcome of branch
        – Only stall if prediction is wrong
- MIPS pipeline
    – Can predict branches not taken
    – Fetch instruction after branch, with no delay
    
     ![App Screenshot](https://github.com/bhim4078652/MIPS_32_PIPELINED/blob/main/IMAGE_REQ/p3.jpg)

### design of forwarding unit :
#### conditions 
1. EX/MEM.RegisterRd = ID/EX.RegisterRs or EX/MEM.RegisterRd = ID/EX.RegisterRt
2. MEM/WB.RegisterRd = ID/EX.RegisterRs or  MEM/WB.RegisterRd = ID/EX.RegisterRt
3. Only if forwarding instruction will write to a register
4. Only if Rd for that instruction is not $zero

| Mux control   | Source  | Explanation                                                                    | 
|---------------|---------|--------------------------------------------------------------------------------|
| ForwardA = 00 | ID/EX   | The first ALU operand comes from the register file.                            |   
| ForwardA = 10 | EX/MEM  | The first ALU operand is forwarded from the prior.                             |   
| ForwardA = 01 | MEM/WB  | The first ALU operand is forwarded from data memory or an earlier ALU result.  |   
| ForwardB = 00 | ID/EX   | The second ALU operand comes from the register file.                           |   
| ForwardB = 10 | EX/MEM  | The second ALU operand is forwarded from the prior.                            |  
| ForwardA = 01 | MEM/WB  | The second ALU operand is forwarded from data memory or an earlier ALU result. |   

   ![App Screenshot](https://github.com/bhim4078652/MIPS_32_PIPELINED/blob/main/IMAGE_REQ/p4.jpg)


### double data hazrad
###### add $1,$1,$2
###### add $1,$1,$3
###### add $1,$1,$4

-  Both hazards occur – Want to use the most recent
-  Revise MEM hazard condition – Only fwd if EX hazard condition isn’t true

    ![App Screenshot](https://github.com/bhim4078652/MIPS_32_PIPELINED/blob/main/IMAGE_REQ/p5.jpg)

### design of hazard detection unit :
- Check when instruction using lw is decoded in ID.
- ID/EX.MemRead and ((ID/EX.RegisterRt = IF/ID.RegisterRs) or (ID/EX.RegisterRt = IF/ID.RegisterRt))
- If detected, stall and insert bubble.

### final picture of pipelined datapath
   ![App Screenshot](https://github.com/bhim4078652/MIPS_32_PIPELINED/blob/main/IMAGE_REQ/p6.jpg)
   

