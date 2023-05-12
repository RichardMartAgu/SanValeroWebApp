package com.sanValero.Domain;

import lombok.*;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
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

