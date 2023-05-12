package com.sanValero.dao;

import com.sanValero.domain.Subject;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import java.util.List;

public interface SubjectDAO {

  @SqlQuery("SELECT * FROM Subjects")
  @UseRowMapper(SubjectMapper.class)
  List<Subject> getSubject();

  @SqlQuery("SELECT * FROM Subjects WHERE Id_Subject = ?")
  @UseRowMapper(SubjectMapper.class)
  Subject getSubject(int subject);

}