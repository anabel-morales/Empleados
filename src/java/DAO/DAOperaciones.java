package DAO;

import POJOS.Departamento;
import POJOS.Empleado;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import java.util.Iterator;

public class DAOperaciones {

    public void insertarDepartamento(Departamento _ObjDepar, SessionFactory _SessionBuilder) {
        Session sesion = _SessionBuilder.openSession();
        Transaction Tx = null;
        try {
            Tx = sesion.beginTransaction();
            sesion.save(_ObjDepar);
            Tx.commit();
        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (Tx != null) {
                Tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

    public void insertarDepartamentoEmpleados(Departamento _objDepartamento, SessionFactory _SessionBuilder) {
        Session sesion = _SessionBuilder.openSession();
        Transaction Tx = null;
        try {
            Tx = sesion.beginTransaction();
            sesion.save(_objDepartamento);
            Tx.commit();
        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (Tx != null) {
                Tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

    public void borrarDepartamento(String _codDepartamento, SessionFactory _SessionBuilder) {
        Session sesion = _SessionBuilder.openSession();
        Transaction Tx = null;
        try {
            Tx = sesion.beginTransaction();
            String hql = "from Departamento where codigo= :vcodDepartamento";
            Query q = sesion.createQuery(hql);
            q.setParameter("vcodDepartamento", _codDepartamento);
            Departamento objDepart = (Departamento) q.uniqueResult();
            sesion.delete(objDepart);
            Tx.commit();
        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (Tx != null) {
                Tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

//    public void SaveOrUpdate(Departamento _objDepartamento, SessionFactory _SessionBuilder) {
//        Session sesion = _SessionBuilder.openSession();
//        Transaction Tx = null;
//        try {
//            Tx = sesion.beginTransaction();
//            sesion.saveOrUpdate(_objDepartamento);
//            Tx.commit();
//        } catch (HibernateException HE) {
//            HE.printStackTrace();
//            if (Tx != null) {
//                Tx.rollback();
//            }
//            throw HE;
//        } finally {
//            sesion.close();
//        }
//
//    }
    public void modificarDepartamento(Departamento _TransientObjDepartamento, SessionFactory _SessionBuilder) {

        Session sesion = _SessionBuilder.openSession();
        Transaction Tx = null;
        try {
            Tx = sesion.beginTransaction();
            String hql = "from Departamento where codigo= :vcodigo";
            Query q = sesion.createQuery(hql);
            q.setParameter("vcodigo", _TransientObjDepartamento.getCodigo());
            Departamento PersistentObjDepartamento = (Departamento) q.uniqueResult();

            _TransientObjDepartamento.setId(PersistentObjDepartamento.getId());
            Hibernate.initialize(PersistentObjDepartamento.getEmpleados());
            sesion.merge(_TransientObjDepartamento);

            Tx.commit();

        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (Tx != null) {
                Tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

    public void insertarEmpleado(Empleado _ObjEmpleado, SessionFactory _SessionBuilder) {
        Session sesion = _SessionBuilder.openSession();
        Transaction Tx = null;
        try {
            Tx = sesion.beginTransaction();
            sesion.save(_ObjEmpleado);
            Tx.commit();
        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (Tx != null) {
                Tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }

    }

    public void borrarEmpleado(String _nifEmpleado, String _passwordEmpleado, SessionFactory _SessionBuilder) {
        Session sesion = _SessionBuilder.openSession();
        Transaction Tx = null;
        try {
            Tx = sesion.beginTransaction();
            String hql = "from Empleado where nif= :vnifEmpleado and password= :vpasswordEmpleado";
            Query q = sesion.createQuery(hql);
            q.setParameter("vnifEmpleado", _nifEmpleado);
            q.setParameter("vpasswordEmpleado", _passwordEmpleado);
            Empleado objEmpleado = (Empleado) q.uniqueResult();
            sesion.delete(objEmpleado);
            Tx.commit();
        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (Tx != null) {
                Tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

    public void modificarEmpleado(Empleado _TransientObjEmpleado, SessionFactory _SessionBuilder) {

        Session sesion = _SessionBuilder.openSession();
        Transaction Tx = null;
        try {
            Tx = sesion.beginTransaction();
            String hql = "from Empleado where nif= :vnif";
            Query q = sesion.createQuery(hql);
            q.setParameter("vnif", _TransientObjEmpleado.getNif());
            Empleado PersistentObjEmpleado = (Empleado) q.uniqueResult();

            _TransientObjEmpleado.setId(PersistentObjEmpleado.getId());

            sesion.merge(_TransientObjEmpleado);

            Tx.commit();

        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (Tx != null) {
                Tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

    public List<Empleado> getListadoGeneralEmpleados(SessionFactory _SessionBuilder) {
        Session sesion = _SessionBuilder.openSession();
        Transaction Tx = null;
        Tx = sesion.beginTransaction();
        try {
            String hql = "from Empleado";
            Query q = sesion.createQuery(hql);
            List ListadoEmpleados = q.list();
            Iterator IterEmpleado = ListadoEmpleados.iterator();
            while (IterEmpleado.hasNext()) {
                Empleado objEmpleado = (Empleado) IterEmpleado.next();
                Hibernate.initialize(objEmpleado.getDepartamento());
            }

            return ListadoEmpleados;
        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (Tx != null) {
                Tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

    public List<Departamento> listadoDepartamentoyEmpleados(String _codigo, SessionFactory _SessionBuilder) {
    Session sesion = _SessionBuilder.openSession();
        Transaction Tx = null;
        Tx = sesion.beginTransaction();
        try {
            String hql = "from Departamento where codigo= :vcodigo";
            Query q = sesion.createQuery(hql);
            q.setParameter("vcodigo", _codigo);
            List<Departamento> ListadoDepartamento = q.list();
            Iterator IterDepartamento = ListadoDepartamento.iterator();
            while (IterDepartamento.hasNext()) {
                Departamento objDepartamento = (Departamento) IterDepartamento.next();
                Hibernate.initialize(objDepartamento.getEmpleados());
            }
            return ListadoDepartamento;
        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (Tx != null) {
                Tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    
    }
      public List<Departamento> getListadoGeneralDepartamentos(SessionFactory _SessionBuilder) {
        Session sesion = _SessionBuilder.openSession();
        Transaction Tx = null;
        Tx = sesion.beginTransaction();
        try {
            String hql = "from Departamento";
            Query q = sesion.createQuery(hql);
            List<Departamento> ListadoDepartamento = q.list();
            return ListadoDepartamento;

        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (Tx != null) {
                Tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }
}
