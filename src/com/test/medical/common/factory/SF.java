package com.test.medical.common.factory;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.Reader;

public class SF {
    private static SqlSessionFactory f;

    private SF() {
    }

    static {
        try {
            Reader reader = Resources.getResourceAsReader("config.xml");
            f = new SqlSessionFactoryBuilder().build(reader);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static SqlSession getSession() {
        return f.openSession();
    }
}
