package com.sample.command;

import com.sample.dao.BDao;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.Objects;

public class BDeleteCommand implements BCommand{
    @Override
    public void execute(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        String bId = request.getParameter("bid");

        BDao dao = new BDao();
        dao.delete(bId);
    }
}
