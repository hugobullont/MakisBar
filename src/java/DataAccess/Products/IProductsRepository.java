/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Products;

import Entities.Makis;
import Entities.RelRestMak;
import java.util.List;

/**
 *
 * @author Usuario
 */
public interface IProductsRepository {
    List<RelRestMak> GetMakisByRestaurant(int idRest);
}
