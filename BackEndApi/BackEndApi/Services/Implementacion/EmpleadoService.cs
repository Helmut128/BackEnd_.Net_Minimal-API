using Microsoft.EntityFrameworkCore;
using BackEndApi.Models;
using BackEndApi.Services.Contrato;

namespace BackEndApi.Services.Implementacion
{
    public class EmpleadoService : IEmpleadoService
    {
        private DbempleadoContext _dvContext;

        public EmpleadoService(DbempleadoContext dvContex)
        {
            _dvContext = dvContex;
        }

        public async Task<List<Empleado>> GetList()
        {
            try {
                List<Empleado> lista = new List<Empleado>();
                lista = await _dvContext.Empleados.Include(dtp => dtp.IdDepartamentoNavigation).ToListAsync();

                return lista;
            
            } catch (Exception ex) {
                throw ex;
            }
        }

        public async Task<Empleado> Get(int idEmpleado)
        {
            try
            {
                Empleado? encontrado = new Empleado();

                encontrado = await _dvContext.Empleados.Include(dpt => dpt.IdDepartamentoNavigation)
                    .Where(e => e.IdEmpleado == idEmpleado).FirstOrDefaultAsync();

                return encontrado;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public async Task<Empleado> Add(Empleado modelo)
        {
            try
            {
                _dvContext.Empleados.Add(modelo);
                await _dvContext.SaveChangesAsync();
                return modelo; 

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> Update(Empleado modelo)
        {
            try
            {
                _dvContext.Empleados.Update(modelo);
                await _dvContext.SaveChangesAsync();
                return true;


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> Delete(Empleado modelo)
        {
            try
            {
                _dvContext.Empleados.Remove(modelo);
                await _dvContext.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

       
       
    }
}
