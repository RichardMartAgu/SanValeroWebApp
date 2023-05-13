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
      "INSERT INTO SUBJECTS (subject_name, subject_description, subject_year, duration, teacher, image) VALUES (?, ?, ?, ?, ?, ?)")
  void addSubject(
          String subjecName, String subjectDescription, String subjectYear, int duration, String teacher, String image);

  @SqlUpdate("DELETE FROM SUBJECTS WHERE id_subject = ?")
  void deleteSubject(int idSubject);

  @SqlQuery("SELECT * FROM SUBJECTS WHERE id_subject = ?")
  @UseRowMapper(SubjectMapper.class)
  Subject searchSubjectById(int id_subject);

  @SqlUpdate(
      "UPDATE SUBJECTS SET SUBJECT_NAME = ?, SUBJECT_DESCRIPTION = ?, SUBJECT_YEAR = ?, DURATION = ?,TEACHER = ? WHERE ID_SUBJECT= ?")
  void editSubject(
       String subjecName, String subjectDescription, String subjectYear,int duration, String teacher,int idSubject);

  @SqlUpdate("UPDATE SUBJECTS SET image= ? WHERE ID_PRODUCT= ?")
  void modifyImageProduct(String image, int id_product);

  @SqlQuery("SELECT * FROM SUBJECTS WHERE SUBJECT_NAME like ? or TEACHER like ?")
  @UseRowMapper(SubjectMapper.class)
  List<Subject> searchSubjectByNameOrTeacher(
      @Bind("name_p") String name_p, @Bind("description_p") String description_p);
}