using Microsoft.EntityFrameworkCore;
 using BackEndApi.Models;
 using BackEndApi.Services.Contrato;

namespace BackEndApi.Services.Implementacion
{
    public class DepartamentoService :  IDepartamentoService
    {
        private DbempleadoContext _dvContext;

        public DepartamentoService(DbempleadoContext dvContex)
        {
            _dvContext = dvContex;
        }

        public async Task<List<Departamento>> GetList()
        {
            try
            {
                List<Departamento> lista = new List<Departamento>();
                lista = await _dvContext.Departamentos.ToListAsync();
                return lista;
            }

            catch (Exception ex)
            {
                throw ex; 
            }
        }
    }
}
