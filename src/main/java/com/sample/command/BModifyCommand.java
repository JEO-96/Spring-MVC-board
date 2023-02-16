package com.sample.command;

import com.sample.dao.BDao;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class BModifyCommand implements BCommand{
    @Override
    public void execute(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        int bId = Integer.parseInt(request.getParameter("bid"));
        String bName = request.getParameter("bname");
        String bTitle = request.getParameter("btitle");
        String bContent = request.getParameter("bcontent");

        BDao dao = new BDao();
        dao.modify(bId, bName, bTitle, bContent);
    }
}
