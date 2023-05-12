package com.Svalero.dao;

import com.Svalero.domain.Student;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface StudentDAO {

    @SqlQuery("SELECT * FROM students")
    @UseRowMapper(StudentMapper.class)
    List<Student> getStudents();


    @SqlQuery("SELECT * FROM students WHERE id_student = ?")
    @UseRowMapper(StudentMapper.class)
    Student getStudentById(int id_student);
}