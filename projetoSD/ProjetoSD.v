module ProjetoSD (input clk,
						input tecla_0,tecla_1,tecla_2,tecla_3,tecla_4,tecla_5,tecla_6,tecla_7,tecla_8,tecla_9,tecla_A,tecla_B,tecla_C,tecla_D,tecla_Ast,tecla_Hash,
						output reg[13:0] resultado,
						output reg sinal);


reg[6:0] numero1 = 0, numero2 = 0;
reg[3:0] state;
parameter numero1Input = 0, numero2Input = 1, somaOutput = 2, subOutput = 3, multOutput = 4;

always @(negedge clk)begin
	if(!tecla_Ast)begin
		state <= numero1Input;
	end
	else if(!tecla_Hash)begin
		state <= numero2Input;
	end
	else if(!tecla_A)begin
		state <= somaOutput;
	end
	else if(!tecla_B)begin
		state <= subOutput;
	end
	else if(!tecla_C)begin
		state <= multOutput;
	end
	else if(!tecla_D)begin
	end
end

always @(*)begin
	    case(state)
		numero1Input: begin
			if(numero1 < 99 || numero2 == 99)begin
				if(!tecla_0)
					numero1 <= (numero1 % 10) * 10 + 0;
				else if(!tecla_1)
					numero1 <= (numero1 % 10) * 10 + 1;
				else if(!tecla_2)
					numero1 <= (numero1 % 10) * 10 + 2;
				else if(!tecla_3)
					numero1 <= (numero1 % 10) * 10 + 3;
				else if(!tecla_4)
					numero1 <= (numero1 % 10) * 10 + 4;
				else if(!tecla_5)
					numero1 <= (numero1 % 10) * 10 + 5;
				else if(!tecla_6)
					numero1 <= (numero1 % 10) * 10 + 6;
				else if(!tecla_7)
					numero1 <= (numero1 % 10) * 10 + 7;
				else if(!tecla_8)
					numero1 <= (numero1 % 10) * 10 + 8;
				else if(!tecla_9)
					numero1 <= (numero1 % 10) * 10 + 9;
			end
        end
		numero2Input: begin
			if(numero2 < 99 || numero2 == 99)begin
				if(!tecla_0)
					numero2 <= (numero2 % 10) * 10 + 0;
				else if(!tecla_1)
					numero2 <= (numero2 % 10) * 10 + 1;
				else if(!tecla_2)
					numero2 <= (numero2 % 10) * 10 + 2;
				else if(!tecla_3)
					numero2 <= (numero2 % 10) * 10 + 3;
				else if(!tecla_4)
					numero2 <= (numero2 % 10) * 10 + 4;
				else if(!tecla_5)
					numero2 <= (numero2 % 10)* 10 + 5;
				else if(!tecla_6)
					numero2 <= (numero2 % 10)* 10 + 6;
				else if(!tecla_7)
					numero2 <= (numero2 % 10)* 10 + 7;
				else if(!tecla_8)
					numero2 <= (numero2 % 10)* 10 + 8;
				else if(!tecla_9)
					numero2 <= (numero2 % 10)* 10 + 9;
			end
        end
		somaOutput: begin
			resultado <= numero1 + numero2;
			sinal <= 0;
        end
		subOutput: begin
			if(numero1 > numero2 || numero1 == numero2)begin
				resultado <= numero1 - numero2;
				sinal <= 0;
			end
			else begin
				resultado <= numero2 - numero1;
				sinal <= 1;
			end
        end
		multOutput: begin
			resultado <= numero1 * numero2;
			sinal <= 0;
        end
		endcase
end
endmodule