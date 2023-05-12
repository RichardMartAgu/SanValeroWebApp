package com.sanValero.dao;

import com.sanValero.domain.Student;

import java.util.List;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

public interface StudentDAO {




    @SqlQuery("SELECT * FROM clients")
    @UseRowMapper(StudentMapper.class)
    List<Student> getStudents();

    @SqlUpdate("INSERT INTO STUDENTS (first_name, last_name, DNI, address, telephone, image)" +
            " VALUES (?, ?, ?, ?, ?, ?)")
    void addRegister(String first_Name, String last_Name, String DNI, String address, String
                           telephone, String image);


    @SqlQuery("SELECT * FROM STUDENTS WHERE id_student=?")
    @UseRowMapper(StudentMapper.class)
    Student searchStudent(int id_student);


    @SqlUpdate("DELETE FROM STUDENTS WHERE id_student=?")
    void deleteStudent(int id_student);

    @SqlQuery("SELECT * FROM STUDENTS WHERE FIRST_NAME like ? or LAST_NAME like ? or DNI like ?")
    @UseRowMapper(StudentMapper.class)
    List<Student> searchStudentByFirstnameOrLastnameOrDni(@Bind("firstname") String firstname, @Bind("lastname") String lastname, @Bind("dni") String dni);


}
