/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Makis;

import Entities.Makis;
import Entities.RelRestMak;
import java.util.List;

/**
 *
 * @author Usuario
 */
public interface IMakisRepository {
    List<RelRestMak> GetMakisByRestaurant(int idRest);
}
