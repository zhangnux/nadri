package com.nadri.user.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/*
 * @Target : 어노테이션 적용 대상, ElementType.PARAMETER는 메소드나 생성자의 매개변수에 부착할 수 있는 어노테이션임 
 * @Retention : 어노테이션 유지 정책, RetentionPolicy.RUNTIME은 어노테이션이 프로그램 실행시점까지 유지됨
 *
 */
@Target(ElementType.PARAMETER)
@Retention(RetentionPolicy.RUNTIME)
public @interface LoginedUser {

}
