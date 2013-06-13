<?php
namespace mio\mioBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use mio\mioBundle\Entity\Empleado;
use mio\mioBundle\Entity\Role;
use Symfony\Component\Security\Core\Encoder\MessageDigestPasswordEncoder;

use Doctrine\Common\Persistence\ObjectManager;

class LoadEmpleadoData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
         
      $caracteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      $caracteres1 = 'abcdefghijklmnopqrstuvwxyz';
      $dni='';

        for($j = 0; $j < 8; $j++)
        {
          $numero = mt_rand(0,9);
          $dni = $dni . $numero;
        }
        $numero = mt_rand(0,strlen($caracteres1)-1);
        $caracter = $caracteres1{$numero};
        $dni = $dni . $caracteres1{$numero};
        $empleado = new Empleado();
			  $empleado->setDni($dni);
          $empleado->setNombre("Empleado0");
          $empleado->setUsername("empleado0");
          $empleado->setApellido1("Apellido1");
          $empleado->setApellido2("Apellido2");
          $empleado->setEmail("empleado0@gmail.com");
          $empleado->setDireccion("Direccion");
          $empleado->setTelefono("9568940821");
          $empleado->setMovil("625032634");
          $empleado->setIdioma("es");
          $empleado->setTema("cobalt");
          $pass = "empleado0";
       	$empleado->setLocalidad("Localidad");
       	$empleado->setProvincia("Provincia");
       	$empleado->setFechaAlta(new \DateTime());
       	$empleado->setActivo(1);
       	$empleado->setSalt(md5(time()));
        $claveusuario='';
        mt_srand(microtime() * 1000000); 
        for($j = 0; $j < 20; $j++)
        {
          /* Genera un valor aleatorio mejorado con mt_rand, entre 0 y el tamaño del array $caracteres menos 1. Posteríormente vamos concatenando en la cadena $password
          los caracteres que se van eligiendo aleatoriamente.*/
          $caracter = mt_rand(0,strlen($caracteres)-1);
          $claveusuario = $claveusuario . $caracteres{$caracter};
        }
        $empleado->setClaveusuario($claveusuario);
       	
       	/********************contraseña*****************/
       	$encoder = new MessageDigestPasswordEncoder('sha1');
        $password = $encoder->encodePassword($pass, $empleado->getSalt());
        $empleado->setPassword($password);
       	/***************************************/
    		$empleado->setRole($this->getReference('admin-role'));
			$manager->persist($empleado);
      $dni='';
    	$manager->flush();
    	// store reference of admin-user for other Fixtures
      //$this->addReference('admin-user', $empleado);
     }
        
    public function getOrder()
    {
        return 1;     
    }
}