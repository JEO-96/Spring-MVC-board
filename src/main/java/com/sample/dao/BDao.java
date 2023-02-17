package com.sample.dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sample.dto.BDto;

import java.sql.*;
import java.util.ArrayList;

public class BDao {

    DataSource dataSource = null;

    public BDao() {
        Connection connection = null;
        try {
            Context init = new InitialContext();
            dataSource = (DataSource) init.lookup("java:comp/env/jdbc/postgresql");
            connection = dataSource.getConnection();
            System.out.println("연결성공");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public void write(String bName, String bTitle, String bContent) {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = dataSource.getConnection();
            String query = "insert into mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent) " +
                    "values (nextval('mvc_board_seq'), ?, ?, ?, 0, currval('mvc_board_seq'), 0, 0 )";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, bName);
            preparedStatement.setString(2, bTitle);
            preparedStatement.setString(3, bContent);
            int rn = preparedStatement.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e2) {
                // TODO: handle exception
                e2.printStackTrace();
            }
        }
    }


    public ArrayList<BDto> list() {

        ArrayList<BDto> dtos = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = dataSource.getConnection();

            String query = "select bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent " +
                    "from mvc_board order by bGroup desc, bStep asc";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int bId = resultSet.getInt("bid");
                String bName = resultSet.getString("bname");
                String bTitle = resultSet.getString("btitle");
                String bContent = resultSet.getString("bcontent");
                Timestamp bDate = resultSet.getTimestamp("bdate");
                int bHit = resultSet.getInt("bhit");
                int bGroup = resultSet.getInt("bgroup");
                int bStep = resultSet.getInt("bstep");
                int bIndent = resultSet.getInt("bindent");

                BDto dto = new BDto(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
                dtos.add(dto);
            }

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e2) {
                // TODO: handle exception
                e2.printStackTrace();
            }
        }
        return dtos;
    }


    private void upHit(String strId){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = dataSource.getConnection();
            String query = "UPDATE mvc_board SET bhit = bhit + 1 WHERE bid = " + strId + "";
            preparedStatement = connection.prepareStatement(query);

            int rn = preparedStatement.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }
    }



    public BDto contentView(String strId) {
        upHit(strId);

        BDto dto = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = dataSource.getConnection();

            String query = "select * from mvc_board where bId = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Integer.parseInt(strId));
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int bId = resultSet.getInt("bid");
                String bName = resultSet.getString("bname");
                String bTitle = resultSet.getString("btitle");
                String bContent = resultSet.getString("bcontent");
                Timestamp bDate = resultSet.getTimestamp("bdate");
                int bHit = resultSet.getInt("bhit");
                int bGroup = resultSet.getInt("bgroup");
                int bStep = resultSet.getInt("bstep");
                int bIndent = resultSet.getInt("bindent");

                dto = new BDto(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if(connection != null) connection.close();

            } catch (Exception e2) {

            }
        }
        return dto;
    }

    public void delete(String strId){
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = dataSource.getConnection();
            String query="delete from mvc_board where bId=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Integer.parseInt(strId));
            int rn = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public BDto reply_view(String str) {
        BDto dto = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = dataSource.getConnection();
            String query = "select * from mvc_board where bId = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Integer.parseInt(str));
            resultSet = preparedStatement.executeQuery();

            if(resultSet.next()) {
                int bId = resultSet.getInt("bid");
                String bName = resultSet.getString("bname");
                String bTitle = resultSet.getString("btitle");
                String bContent = resultSet.getString("bcontent");
                Timestamp bDate = resultSet.getTimestamp("bdate");
                int bHit = resultSet.getInt("bhit");
                int bGroup = resultSet.getInt("bgroup");
                int bStep = resultSet.getInt("bstep");
                int bIndent = resultSet.getInt("bindent");

                dto = new BDto(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            try{
                if(preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) connection.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
            return dto;
        }
    }

    public void reply(String bId, String bName, String bTitle, String bContent, String bGroup, String bStep, String bIndent) {
        replyShape(bGroup, bStep);

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = dataSource.getConnection();
            String query = "insert into mvc_board (bId, bName, bTitle, bContent, bGroup, bStep, bIndent) " +
                    "values (nextval('mvc_board_seq'), ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, bName);
            preparedStatement.setString(2, bTitle);
            preparedStatement.setString(3, bContent);
            preparedStatement.setInt(4, Integer.parseInt(bGroup));
            preparedStatement.setInt(5, Integer.parseInt(bStep));
            preparedStatement.setInt(6, Integer.parseInt(bIndent));

            int rn = preparedStatement.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e2) {

            }
        }
    }
    private void replyShape(String strGroup, String strStep) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = dataSource.getConnection();
            String query = "update mvc_board set bStep = bStep + 1 where bGroup = ? and bStep > ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Integer.parseInt(strGroup));
            preparedStatement.setInt(2, Integer.parseInt(strStep));
            int rn = preparedStatement.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            try {
                if(preparedStatement != null) preparedStatement.close();
                if(connection != null) connection.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    public void modify(int bId, String bName, String bTitle, String bContent) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = dataSource.getConnection();
            String query = "UPDATE mvc_board "
                    + "SET bname='" + bName + "', btitle='" + bTitle + "', bcontent='" + bContent + "'"
                    + "WHERE bid = " + bId;
            preparedStatement = connection.prepareStatement(query);

            int rn = preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(preparedStatement != null) preparedStatement.close();
                if(connection != null) connection.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
}
