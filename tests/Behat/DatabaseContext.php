<?php

declare(strict_types=1);

namespace App\Tests\Behat;

use Behat\Behat\Context\Context;
use Doctrine\ORM\EntityManager;
use Symfony\Component\HttpKernel\KernelInterface;

/**
 * Class DatabaseContext
 * @package App\Tests\Behat
 */
final class DatabaseContext implements Context
{
    /** @var KernelInterface */
    private $kernel;

    public function __construct(KernelInterface $kernel)
    {
        $this->kernel = $kernel;
    }

    /**
     * @Given The database is empty
     */
    public function clearData()
    {
        // TODO: use ORMPurger() instead?
        /** @var EntityManager $em */
        $em = $this->kernel->getContainer()->get('doctrine')->getManager();
        $connection = $em->getConnection();
        $platform = $connection->getDatabasePlatform();

        $connection->executeUpdate($platform->getTruncateTableSQL('color', true));
    }
}
