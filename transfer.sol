// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentWithReason {
    // Dirección del destinatario de los fondos
    address payable public owner = payable(0x726D7521DF9dddEb24cbc1A45B271dD98a5773cA);

    // Evento que se dispara cuando se recibe un pago con un motivo
    event PaymentReceived(address indexed sender, uint256 amount, string reason);

    // Función para recibir pagos con un motivo
    function sendPayment(string memory reason) public payable {
        require(msg.value > 0, "Debe enviar algun valor.");

        // Transferir el monto al propietario
        owner.transfer(msg.value);
        

        // Emitir el evento con la información del pago
        emit PaymentReceived(msg.sender, msg.value, reason);
    }
}
