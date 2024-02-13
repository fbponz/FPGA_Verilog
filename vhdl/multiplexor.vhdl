o_Data <= i_Data0 when i_Sel1 = '0' and i_Sel0 = '0' else
          i_Data1 when i_Sel1 = '0' and i_Sel0 = '1' else
          i_Data2 when i_Sel1 = '1' and i_Sel0 = '0' else
          i_Data3;