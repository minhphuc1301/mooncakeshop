/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.MoonCakeDTO;
import dtos.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author 84909
 */
public class MoonCakeDAO {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    public void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (con != null) {
            con.close();
        }
    }

    public List<MoonCakeDTO> pageingProduct(int index) throws Exception {
        List<MoonCakeDTO> list = new ArrayList<>();
        String sql = "Select productID,productName,description,price,unitInstock,CategoryID,imageUrl,createDate,expirationDate,status From tblProduct Where unitInstock>0 and status=? Order By createDate DESC Offset ? rows fetch next 4 rows only";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, ("Active"));
            stm.setInt(2, (index - 1) * 4);
            rs = stm.executeQuery();
            while (rs.next()) {

                list.add(new MoonCakeDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("imageUrl"), rs.getString("status"), rs.getFloat("price"), rs.getInt("unitInstock"), rs.getInt("CategoryID"), rs.getDate("createDate"), rs.getDate("expirationDate")));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<MoonCakeDTO> pageingAllProduct(int index) throws Exception {
        List<MoonCakeDTO> list = new ArrayList<>();
        String sql = "Select productID,productName,description,price,unitInstock,CategoryID,imageUrl,createDate,expirationDate,status From tblProduct Order By createDate DESC Offset ? rows fetch next 4 rows only";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);

            stm.setInt(1, (index - 1) * 4);
            rs = stm.executeQuery();
            while (rs.next()) {

                list.add(new MoonCakeDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("imageUrl"), rs.getString("status"), rs.getFloat("price"), rs.getInt("unitInstock"), rs.getInt("CategoryID"), rs.getDate("createDate"), rs.getDate("expirationDate")));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<MoonCakeDTO> pageingProductAllByname(String productName, int index) throws Exception {
        List<MoonCakeDTO> list = new ArrayList<>();
        String sql = "Select productID,productName,description,price,unitInstock,CategoryID,imageUrl,createDate,expirationDate,status From tblProduct Where productName like Order By createDate DESC Offset ? rows fetch next 4 rows only";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + productName + "%");

            stm.setInt(2, (index - 1) * 4);
            rs = stm.executeQuery();
            while (rs.next()) {

                list.add(new MoonCakeDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("imageUrl"), rs.getString("status"), rs.getFloat("price"), rs.getInt("unitInstock"), rs.getInt("CategoryID"), rs.getDate("createDate"), rs.getDate("expirationDate")));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<MoonCakeDTO> pageingProductByname(String productName, int index) throws Exception {
        List<MoonCakeDTO> list = new ArrayList<>();
        String sql = "Select productID,productName,description,price,unitInstock,CategoryID,imageUrl,createDate,expirationDate,status From tblProduct Where unitInstock>0 and productName like ? and status=? Order By createDate DESC Offset ? rows fetch next 4 rows only";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + productName + "%");
            stm.setString(2, "Active");
            stm.setInt(3, (index - 1) * 4);
            rs = stm.executeQuery();
            while (rs.next()) {

                list.add(new MoonCakeDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("imageUrl"), rs.getString("status"), rs.getFloat("price"), rs.getInt("unitInstock"), rs.getInt("CategoryID"), rs.getDate("createDate"), rs.getDate("expirationDate")));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<MoonCakeDTO> pageingProductByCategory(String productName, int index, int cateID) throws Exception {
        List<MoonCakeDTO> list = new ArrayList<>();
        String sql = "Select productID,productName,description,price,unitInstock,CategoryID,imageUrl,createDate,expirationDate,status From tblProduct Where unitInstock>0 and productName like ? and status=? and CategoryID=? Order By createDate DESC Offset ? rows fetch next 4 rows only";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + productName + "%");
            stm.setString(2, "Active");
            stm.setInt(3, cateID);
            stm.setInt(4, (index - 1) * 4);
            rs = stm.executeQuery();
            while (rs.next()) {

                list.add(new MoonCakeDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("imageUrl"), rs.getString("status"), rs.getFloat("price"), rs.getInt("unitInstock"), rs.getInt("CategoryID"), rs.getDate("createDate"), rs.getDate("expirationDate")));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<MoonCakeDTO> pageingProductByLessPrice(String productName, int index, int cateID, int price) throws Exception {
        List<MoonCakeDTO> list = new ArrayList<>();
        String sql = "Select productID,productName,description,price,unitInstock,CategoryID,imageUrl,createDate,expirationDate,status From tblProduct Where unitInstock>0 and productName like ? and status=? and CategoryID=? and price < ? Order By price ASC Offset ? rows fetch next 4 rows only";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + productName + "%");
            stm.setString(2, "Active");
            stm.setInt(3, cateID);
            stm.setInt(4, (index - 1) * 4);
            stm.setInt(5, price);
            rs = stm.executeQuery();
            while (rs.next()) {

                list.add(new MoonCakeDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("imageUrl"), rs.getString("status"), rs.getFloat("price"), rs.getInt("unitInstock"), rs.getInt("CategoryID"), rs.getDate("createDate"), rs.getDate("expirationDate")));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<MoonCakeDTO> pageingProductByLessPrice1(int index, int price) throws Exception {
        List<MoonCakeDTO> list = new ArrayList<>();
        String sql = "Select productID,productName,description,price,unitInstock,CategoryID,imageUrl,createDate,expirationDate,status From tblProduct Where unitInstock>0  and status=? and price < ? Order By price ASC Offset ? rows fetch next 4 rows only";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);

            stm.setString(1, "Active");
            stm.setInt(2, price);
            stm.setInt(3, (index - 1) * 4);

            rs = stm.executeQuery();
            while (rs.next()) {

                list.add(new MoonCakeDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("imageUrl"), rs.getString("status"), rs.getFloat("price"), rs.getInt("unitInstock"), rs.getInt("CategoryID"), rs.getDate("createDate"), rs.getDate("expirationDate")));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<MoonCakeDTO> pageingProductByBiggerPrice1(int index, int price) throws Exception {
        List<MoonCakeDTO> list = new ArrayList<>();
        String sql = "Select productID,productName,description,price,unitInstock,CategoryID,imageUrl,createDate,expirationDate,status From tblProduct Where unitInstock>0  and status=? and price > ? Order By price ASC Offset ? rows fetch next 4 rows only";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);

            stm.setString(1, "Active");
            stm.setInt(2, price);
            stm.setInt(3, (index - 1) * 4);

            rs = stm.executeQuery();
            while (rs.next()) {

                list.add(new MoonCakeDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("imageUrl"), rs.getString("status"), rs.getFloat("price"), rs.getInt("unitInstock"), rs.getInt("CategoryID"), rs.getDate("createDate"), rs.getDate("expirationDate")));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<MoonCakeDTO> pageingProductByPrice2(int index, int price) throws Exception {
        List<MoonCakeDTO> list = new ArrayList<>();
        String sql = "Select productID,productName,description,price,unitInstock,CategoryID,imageUrl,createDate,expirationDate,status From tblProduct Where unitInstock>0  and status=? and price between 30 and ? Order By price ASC Offset ? rows fetch next 4 rows only";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);

            stm.setString(1, "Active");
            stm.setInt(2, price);
            stm.setInt(3, (index - 1) * 4);

            rs = stm.executeQuery();
            while (rs.next()) {

                list.add(new MoonCakeDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("imageUrl"), rs.getString("status"), rs.getFloat("price"), rs.getInt("unitInstock"), rs.getInt("CategoryID"), rs.getDate("createDate"), rs.getDate("expirationDate")));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public int getNumberPageByLessPrice(int price) throws Exception {
        String sql = "Select count(*) From tblProduct where status=? and price < ? and unitInstock>0 ";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, "Active");
            stm.setInt(2, price);

            rs = stm.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 4;
                if (total % 4 != 0) {
                    countPage++;
                }
                return countPage;

            }
        } finally {
            closeConnection();
        }
        return 0;
    }

    public int getNumberPageByBetweenPrice(int price) throws Exception {
        String sql = "Select count(*) From tblProduct where status=? and price between 30 and ? and unitInstock>0 ";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, "Active");
            stm.setInt(2, price);

            rs = stm.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 4;
                if (total % 4 != 0) {
                    countPage++;
                }
                return countPage;

            }
        } finally {
            closeConnection();
        }
        return 0;
    }
 public int getNumberPageByBiggerPrice(int price) throws Exception {
        String sql = "Select count(*) From tblProduct where status=? and price > ? and unitInstock>0 ";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, "Active");
            stm.setInt(2, price);

            rs = stm.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 4;
                if (total % 4 != 0) {
                    countPage++;
                }
                return countPage;

            }
        } finally {
            closeConnection();
        }
        return 0;
    }

    public int getNumberPage() throws Exception {
        String sql = "Select count(*) From tblProduct  ";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 4;
                if (total % 4 != 0) {
                    countPage++;
                }
                return countPage;

            }
        } finally {
            closeConnection();
        }
        return 0;
    }

    public int getNumberPageByStatus() throws Exception {
        String sql = "Select count(*) From tblProduct where status=? and unitInstock>0 ";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, "Active");

            rs = stm.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 4;
                if (total % 4 != 0) {
                    countPage++;
                }
                return countPage;

            }
        } finally {
            closeConnection();
        }
        return 0;
    }

    public int getNumberPageByStatusAndCategoryID(int cate) throws Exception {
        String sql = "Select count(*) From tblProduct where status=? and CategoryID=? and unitInstock>0 ";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, "Active");
            stm.setInt(2, cate);

            rs = stm.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 4;
                if (total % 4 != 0) {
                    countPage++;
                }
                return countPage;

            }
        } finally {
            closeConnection();
        }
        return 0;
    }

    public int getNumberPageByStatusAndCategoryIDAndSearch(String productName, int cate) throws Exception {
        String sql = "Select count(*) From tblProduct where status=? and CategoryID=? and productName like ? and unitInstock>0 ";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, "Active");
            stm.setInt(2, cate);
            stm.setString(3, "%" + productName + "%");
            rs = stm.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 4;
                if (total % 4 != 0) {
                    countPage++;
                }
                return countPage;

            }
        } finally {
            closeConnection();
        }
        return 0;
    }

    public int getNumberPage(String search) throws Exception {
        String sql = "Select count(*) From tblProduct where productName like ? and status=? and unitInstock>0";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            stm.setString(2, "Active");
            rs = stm.executeQuery();

            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 4;
                if (total % 4 != 0) {
                    countPage++;
                }
                return countPage;

            }
        } finally {
            closeConnection();
        }
        return 0;
    }

    public boolean insert(MoonCakeDTO dto) throws Exception {
        boolean check = false;
        String sql = "Insert Into tblProduct(productID,productName,description,price,unitInstock,CategoryID,imageUrl,createDate,expirationDate,status,lastUpdate,updateBy) Values(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {

            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, dto.getProductID());
            stm.setString(2, dto.getProductName());
            stm.setString(3, dto.getDescription());
            stm.setFloat(4, dto.getPrice());
            stm.setInt(5, dto.getUnitInStock());
            stm.setInt(6, dto.getCategoryID());
            stm.setString(7, dto.getImageUrl());
            stm.setDate(8, dto.getCreateDate());
            stm.setDate(9, dto.getExpirationDate());
            stm.setString(10, dto.getStatus());
            stm.setDate(11, dto.getLastUpdate());
            stm.setString(12, dto.getUpdateBy());

            check = stm.executeUpdate() > 0 ? true : false;

        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean update(MoonCakeDTO dto) throws Exception {
        String sql = "Update tblProduct Set productID=?,productName=?,description=?,price=?,unitInstock=?,CategoryID=?,imageUrl=?,createDate=?,expirationDate=?,status=?,lastUpdate=?,updateBy=? Where productID=?";
        boolean check = false;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, dto.getProductID());
            stm.setString(2, dto.getProductName());
            stm.setString(3, dto.getDescription());
            stm.setFloat(4, dto.getPrice());
            stm.setInt(5, dto.getUnitInStock());
            stm.setInt(6, dto.getCategoryID());
            stm.setString(7, dto.getImageUrl());
            stm.setDate(8, dto.getCreateDate());
            stm.setDate(9, dto.getExpirationDate());
            stm.setString(10, dto.getStatus());
            stm.setDate(11, dto.getLastUpdate());
            stm.setString(12, dto.getUpdateBy());
            stm.setString(13, dto.getProductID());
            check = stm.executeUpdate() > 0 ? true : false;

        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateWithNoImage(MoonCakeDTO dto) throws Exception {
        String sql = "Update tblProduct Set productName=?,description=?,price=?,unitInstock=?,CategoryID=?,createDate=?,expirationDate=?,status=?,lastUpdate=?,updateBy=? Where productID=?";
        boolean check = false;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);

            stm.setString(1, dto.getProductName());
            stm.setString(2, dto.getDescription());
            stm.setFloat(3, dto.getPrice());
            stm.setInt(4, dto.getUnitInStock());
            stm.setInt(5, dto.getCategoryID());
            stm.setDate(6, dto.getCreateDate());
            stm.setDate(7, dto.getExpirationDate());
            stm.setString(8, dto.getStatus());
            stm.setDate(9, dto.getLastUpdate());
            stm.setString(10, dto.getUpdateBy());
            stm.setString(11, dto.getProductID());
            check = stm.executeUpdate() > 0 ? true : false;

        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateUnitInStock(String id, int unitInStock) throws Exception {
        String sql = "Update tblProduct Set unitInstock=? Where productID=?";
        boolean check = false;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setInt(1, unitInStock);
            stm.setString(2, id);

            check = stm.executeUpdate() > 0 ? true : false;

        } finally {
            closeConnection();
        }
        return check;
    }

    public MoonCakeDTO getProductByID(String productID) throws Exception {
        MoonCakeDTO dto = new MoonCakeDTO();
        String sql = "Select productID,productName,description,price,unitInstock,CategoryID,imageUrl,createDate,expirationDate,status From tblProduct Where productID=?";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, productID);

            rs = stm.executeQuery();
            if (rs.next()) {

                dto = new MoonCakeDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("imageUrl"), rs.getString("status"), rs.getFloat("price"), rs.getInt("unitInstock"), rs.getInt("CategoryID"), rs.getDate("createDate"), rs.getDate("expirationDate"));
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
}
