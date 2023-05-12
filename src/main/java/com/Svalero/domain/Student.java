package com.Svalero.domain;

import lombok.*;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@ToString
public class Student {

    private int id_student;
    @NonNull
    private String firstName;
    @NonNull
    private String lastName;
    @NonNull
    private String dni;
    @NonNull
    private String address;
    @NonNull
    private String telephone;
    @NonNull
    private String image;
}
