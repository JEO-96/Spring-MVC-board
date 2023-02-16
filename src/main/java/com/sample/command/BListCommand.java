package com.sample.command;

import com.sample.dao.BDao;
import com.sample.dto.BDto;
import org.springframework.ui.Model;

import java.util.ArrayList;

public class BListCommand implements BCommand{

    @Override
    public void execute(Model model){

        BDao dao = new BDao();
        ArrayList<BDto> dtos = dao.list();
        model.addAttribute("list", dtos);
    }
}
