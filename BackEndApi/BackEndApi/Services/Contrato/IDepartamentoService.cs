using BackEndApi.Models;

namespace BackEndApi.Services.Contrato
{
    public interface IDepartamentoService
    {
        Task<List<Departamento>> GetList();
    }
}
