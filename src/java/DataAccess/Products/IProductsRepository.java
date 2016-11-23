/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Products;

import Entities.*;
import Entities.RelRestCmp;
import Entities.RelRestDrk;
import Entities.RelRestMak;
import java.util.List;

/**
 *
 * @author Usuario
 */
public interface IProductsRepository {
    List<RelRestMak> GetMakisByRestaurant(int idRest);
    RelRestMak GetRelMakiByRestaurantMakiId(int idRest, int idMaki);
    List<RelRestDrk> GetDrinksByRestaurant(int idRest);
    RelRestDrk GetRelDrinkByRestaurantDrinkId(int idRest, int idDrink);
    List<RelRestCmp> GetComplByRestaurant(int idRest);
    RelRestCmp GetRelCmpByRestaurantCompId(int idRest, int idCmp);
    void UpdateMakisStock(int idRest, int stock, int idMaki);
    void UpdateDrinksStock(int idRest, int stock, int idDrink);
    void UpdateComplementsStock(int idRest, int stock, int idCmp);
}
