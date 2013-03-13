<div class="content" data-mod="death_log">
    <?php if($this->get('death_log')->count() != 0): ?>
        <?php
            foreach($this->get('death_log') as $log):
                if($log instanceof DetailedPvpKill) {
                    $killer = $log->createPlayer('player_id')->getPlayerHead();
                    $victim = $log->createPlayer('victim_id')->getPlayerHead();
                }
                else {
                    if($log->getPlayerKilled()) {
                        $killer = $log->createEntity()->getImage();
                        $victim = $log->createPlayer()->getPlayerHead();
                    }
                    else {
                        $victim = $log->createEntity()->getImage();
                        $killer = $log->createPlayer()->getPlayerHead();
                    }
                }
                $material= $log->createMaterial();
                $time = new fTimestamp($log->getTime());
        ?>
            <div class="well well-small">
                <div class="row-fluid">
                    <div class="span3">
                        <?php echo $time->format('D d.m.Y'); ?>
                    </div>
                    <div class="span3">
                        <span class="label label-success">
                            <?php echo $killer; ?>
                        </span>
                    </div>
                    <div class="span2">
                        <?php echo $material->getImage(); ?>
                    </div>
                    <div class="span4">
                        <span class="label label-important">
                            <?php echo $victim; ?>
                        </span>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
        <div id="death_logPagination" class="pagination-centered"></div>

        <script type="text/javascript">
            $(document).ready(function () {
                callModulePage(
                    'death_log',
                    <?php echo $this->get('death_log')->getPages(); ?>,
                    <?php echo $this->get('death_log')->getPage(); ?>
                );
            });
        </script>
    <?php else: ?>
    <div class='force-center'><em>No death log.</em></div>
    <?php endif; ?>

</div>