package com.sample.command;

import com.sample.dao.BDao;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class BWriteCommand implements BCommand {

    @Override
    public void execute(Model model) {
        // TODO Auto-generated method stub

        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        String bName = request.getParameter("bname");
        String bTitle = request.getParameter("btitle");
        String bContent = request.getParameter("bcontent");

        BDao dao = new BDao();
        dao.write(bName, bTitle, bContent);
    }
}
