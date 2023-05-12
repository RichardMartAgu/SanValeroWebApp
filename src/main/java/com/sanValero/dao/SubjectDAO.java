package com.sanValero.dao;


import com.sanValero.domain.Subject;

import java.util.List;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

public interface SubjectDAO {

  @SqlQuery("SELECT * FROM SUBJECTS")
  @UseRowMapper(SubjectMapper.class)
  List<Subject> getSubject();

  @SqlUpdate(
      "INSERT INTO SUBJECTS (subject_name, subject_description, subject_year, duration, teacher, image) VALUES (?, ?, ?, ?, ?)")
  void addProduct(
      String name, String description, String year, String duration, String teacher, String image);

  @SqlUpdate("DELETE FROM SUBJECTS WHERE id_subject = ?")
  void deleteProduct(int id_product);

  @SqlQuery("SELECT * FROM SUBJECTS WHERE id_subject = ?")
  @UseRowMapper(SubjectMapper.class)
  Subject searchSubject(int id_subject);

  @SqlUpdate(
      "UPDATE SUBJECTS SET name_p = ?, description_p = ?, format_p = ?,"
          + "price = ? WHERE ID_PRODUCT= ?")
  void modifyProduct(
      String name_p, String description_p, int format_p, float price, int id_product);

  @SqlUpdate("UPDATE SUBJECTS SET image= ? WHERE ID_PRODUCT= ?")
  void modifyImageProduct(String image, int id_product);

  @SqlQuery("SELECT * FROM SUBJECTS WHERE SUBJECT_NAME like ? or TEACHER like ?")
  @UseRowMapper(SubjectMapper.class)
  List<Subject> searchSubjectByNameOrTeacher(
      @Bind("name_p") String name_p, @Bind("description_p") String description_p);
}