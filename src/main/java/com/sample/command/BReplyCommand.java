package com.sample.command;

import com.sample.dao.BDao;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.Objects;

public class BReplyCommand implements BCommand{
    @Override
    public void execute(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        String bId = request.getParameter("bid");

        String bName = request.getParameter("bname");

        String bTitle = request.getParameter("btitle");

        String bContent = request.getParameter("bcontent");

        String bGroup = request.getParameter("bgroup");

        String bStep = request.getParameter("bstep");

        String bIndent = request.getParameter("bindent");

        BDao dao = new BDao();

        dao.reply(bId, bName, bTitle, bContent, bGroup, bStep, bIndent);
    }
}
