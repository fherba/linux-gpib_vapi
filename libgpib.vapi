/*
  Vapi file created from linux-gpib-3.2.19 ib.h and gpib_user.h headers
  
  I hope this works
  
  */

[CCode (cheader_filename="ib.h,gpib_user.h")]

namespace Gpib
{
    /* <-------------------------- Start of gpib_user.h ----------------------------------> */

    public const int GPIB_MAX_NUM_BOARDS;
    public const int GPIB_MAX_NUM_DESCRIPTORS;

    [CCode (cname = "ibsta_bit_numbers", has_type_id = false)]
    public enum IbstaBitNumbers
    {
	    DCAS_NUM,
	    DTAS_NUM,
	    LACS_NUM,
	    TACS_NUM,
	    ATN_NUM,
	    CIC_NUM,
	    REM_NUM,
	    LOK_NUM,
	    CMPL_NUM,
	    EVENT_NUM,
	    SPOLL_NUM,
	    RQS_NUM,
	    SRQI_NUM,
	    END_NUM,
	    TIMO_NUM,
	    ERR_NUM
    }
    
    /* IBSTA status bits (returned by all functions) */
    [CCode (cname = "ibsta_bits", has_type_id = false)]
    public enum IbstaBits
    {
	    DCAS,	/* device clear state */
	    DTAS,	/* device trigger state */
	    LACS,	/* GPIB interface is addressed as Listener */
	    TACS,	/* GPIB interface is addressed as Talker */
	    ATN,	/* Attention is asserted */
	    CIC,	/* GPIB interface is Controller-in-Charge */
	    REM,	/* remote state */
	    LOK,	/* lockout state */
	    CMPL,	/* I/O is complete  */
	    EVENT,	/* DCAS, DTAS, or IFC has occurred */
	    SPOLL,	/* board serial polled by busmaster */
	    RQS,	/* Device requesting service  */
	    SRQI,	/* SRQ is asserted */
	    END,	/* EOI or EOS encountered */
	    TIMO,	/* Time limit on I/O or wait function exceeded */
	    ERR 	/* Function call terminated on error */
    }

    [CCode (cname = "device_status_mask")]
    const int DEVICE_STATUS_MASK;
    [CCode (cname = "board_status_mask")]
    const int BOARD_STATUS_MASK;

    /* IBERR error codes */
    [CCode (cname = "iberr_code", has_type_id = false)]
    public enum IberrCode
    {
	    EDVR,		/* system error */
	    ECIC,	    /* not CIC */
	    ENOL,		/* no listeners */
	    EADR,		/* CIC and not addressed before I/O */
	    EARG,		/* bad argument to function call */
	    ESAC,		/* not SAC */
	    EABO,		/* I/O operation was aborted */
	    ENEB,		/* non-existent board (GPIB interface offline) */
	    EDMA,		/* DMA hardware error detected */
	    EOIP,		/* new I/O attempted with old I/O in progress  */
	    ECAP,		/* no capability for intended opeation */
	    EFSO,		/* file system operation error */
	    EBUS,		/* bus error */
	    ESTB,		/* lost serial poll bytes */
	    ESRQ,		/* SRQ stuck on */
	    ETAB        /* Table Overflow */
    }

    /* Timeout values and meanings */
    [CCode (cname = "gpib_timeout", has_type_id = false, cprefix = "T")]
    public enum GpibTimeout
    {
	    NONE,		/* Infinite timeout (disabled)     */
	    10us,		/* Timeout of 10 usec (ideal)      */
	    30us,		/* Timeout of 30 usec (ideal)      */
	    100us,		/* Timeout of 100 usec (ideal)     */
	    300us,		/* Timeout of 300 usec (ideal)     */
	    1ms,		/* Timeout of 1 msec (ideal)       */
	    3ms,		/* Timeout of 3 msec (ideal)       */
	    10ms,		/* Timeout of 10 msec (ideal)      */
	    30ms,		/* Timeout of 30 msec (ideal)      */
	    100ms,		/* Timeout of 100 msec (ideal)     */
	    300ms,	    /* Timeout of 300 msec (ideal)     */
	    1s,		    /* Timeout of 1 sec (ideal)        */
	    3s,		    /* Timeout of 3 sec (ideal)        */
	    10s,		/* Timeout of 10 sec (ideal)       */
	    30s,		/* Timeout of 30 sec (ideal)       */
	    100s,		/* Timeout of 100 sec (ideal)      */
	    300s,		/* Timeout of 300 sec (ideal)      */
	    1000s		/* Timeout of 1000 sec (maximum)   */
    }

    /* End-of-string (EOS) modes for use with ibeos */
    [CCode (cname = "eos_flags", has_type_id = false)]
    public enum EosFlags
    {
	    EOS_MASK,
	    REOS,		/* Terminate reads on EOS	*/
	    XEOS,	    /* assert EOI when EOS char is sent */
	    BIN		    /* Do 8-bit compare on EOS	*/
    }

    /* GPIB Bus Control Lines bit vector */
    [CCode (cname = "bus_control_line", has_type_id = false)]
    public enum BusControlLine
    {
	    ValidDAV,
	    ValidNDAC,
	    ValidNRFD,
	    ValidIFC,
	    ValidREN,
	    ValidSRQ,
	    ValidATN,
	    ValidEOI,
	    ValidALL,
	    BusDAV,		    /* DAV  line status bit */
	    BusNDAC,		/* NDAC line status bit */
	    BusNRFD,		/* NRFD line status bit */
	    BusIFC,		    /* IFC  line status bit */
	    BusREN,		    /* REN  line status bit */
	    BusSRQ,		    /* SRQ  line status bit */
	    BusATN,		    /* ATN  line status bit */
	    BusEOI		    /* EOI  line status bit */
    }

    [CCode (cname = "old_bus_control_line", has_type_id = false, cprefix = "BUS_")]
    public enum OldBusControlLine
    {
	    DAV,		/* DAV  line status bit */
	    NDAC,		/* NDAC line status bit */
	    NRFD,		/* NRFD line status bit */
	    IFC,		/* IFC  line status bit */
	    REN,		/* REN  line status bit */
	    SRQ,		/* SRQ  line status bit */
	    ATN,		/* ATN  line status bit */
	    EOI		    /* EOI  line status bit */
    }

    /* Possible GPIB command messages */
    [CCode (cname = "cmd_byte", has_type_id = false)]
    public enum CmdByte
    {
	    GTL,	/* go to local			*/
	    SDC,	/* selected device clear 	*/
	    PPConfig,
    //#ifndef PPC
	    PPC = PPConfig,	/* parallel poll configure	*/
    //#endif
	    GET,	/* group execute trigger 	*/
	    TCT,	/* take control 		*/
	    LLO,	/* local lockout		*/
	    DCL,	/* device clear 		*/
	    PPU,	/* parallel poll unconfigure 	*/
	    SPE,	/* serial poll enable 		*/
	    SPD,	/* serial poll disable 		*/
	    LAD,	/* value to be 'ored' in to obtain listen address */
	    UNL,	/* unlisten 			*/
	    TAD,	/* value to be 'ored' in to obtain talk address   */
	    UNT,	/* untalk 			*/
	    SAD,	/* my secondary address (base) */
	    PPE,	/* parallel poll enable (base)	*/
	    PPD	    /* parallel poll disable	*/
    }

    [CCode (cname = "ppe_bits", has_type_id = false, cprefix = "PPC_")]
    public enum PpeBits
    {
	    DISABLE,
	    SENSE,	/* parallel poll sense bit	*/
	    DIO_MASK
    }

	[CCode (cname = "MLA")]
    uint8 MLA( uint addr );
    
	[CCode (cname = "MTA")]
	uint8 MTA( uint addr );

	[CCode (cname = "MSA")]
    uint8 MSA( uint addr );

	[CCode (cname = "PPE_byte")]
    uint8 PPE_byte( uint dio_line, int sense );

	[CCode (cname = "gpib_address_equal")]
    int gpib_address_equal( uint pad1, int sad1, uint pad2, int sad2 );

    [CCode (cname = "gpib_addr_max")]
    const int GPIB_ADDR_MAX;	/* max address for primary/secondary gpib addresses */

    [CCode (cname = "ibask_option", has_type_id = false, cprefix = "Iba")]
    public enum IbaskOption
    {
	    PAD,
	    SAD,
	    TMO,
	    EOT,
	    PPC,	    /* board only */
	    READDR,	    /* device only */
	    AUTOPOLL,	/* board only */
	    CICPROT,	/* board only */
	    IRQ,	    /* board only */
	    SC,	        /* board only */
	    SRE,	    /* board only */
	    EOSrd,
	    EOSwrt,
	    EOScmp,
	    EOSchar,
	    PP2,	    /* board only */
	    TIMING,	    /* board only */
	    DMA,	    /* board only */
	    ReadAdjust,
	    WriteAdjust,
	    EventQueue,	/* board only */
	    SPollBit,	/* board only */
	    SpollBit,	/* board only */
	    SendLLO,	/* board only */
	    SPollTime,	/* device only */
	    PPollTime,	/* board only */
	    EndBitIsNormal,
	    UnAddr,	    /* device only */
	    HSCableLength,	/* board only */
	    Ist,	    /* board only */
	    Rsv,	    /* board only */
	    BNA,	    /* device only */
	    /* linux-gpib extensions */
	    7BitEOS	    /* board only. Returns 1 if board supports 7 bit eos compares*/
    }

    [CCode (cname = "ibconfig_option", has_type_id = false, cprefix = "Ibc")]
    public enum IbconfigOption
    {
	    PAD,
	    SAD,
	    TMO,
	    EOT,
	    PPC,	    /* board only */
	    READDR,	    /* device only */
	    AUTOPOLL,	/* board only */
	    CICPROT,	/* board only */
	    IRQ,	    /* board only */
	    SC,	        /* board only */
	    SRE,	    /* board only */
	    EOSrd,
	    EOSwrt,
	    EOScmp,
	    EOSchar,
	    PP2,	    /* board only */
	    TIMING,	    /* board only */
	    DMA,	    /* board only */
	    ReadAdjust,
	    WriteAdjust,
	    EventQueue,	/* board only */
	    SPollBit,	/* board only */
	    SpollBit,	/* board only */
	    SendLLO,	/* board only */
	    SPollTime,	/* device only */
	    PPollTime,	/* board only */
	    EndBitIsNormal,
	    UnAddr,	    /* device only */
	    HSCableLength,	/* board only */
	    Ist,	    /* board only */
	    Rsv,	    /* board only */
	    BNA	        /* device only */
    }

    [CCode (cname = "t1_delays", has_type_id = false, cprefix = "T1_DELAY_")]
    public enum T1Delays
    {
	    2000ns,
	    500ns,
	    350ns
    }

    [CCode (cname = "request_service_bit")]
    const int REQUEST_SERVICE_BIT;

    [CCode (cname = "gpib_events", has_type_id = false, cprefix = "Event")]
    public enum GpibEvents
    {
	    None,
	    DevTrg,
	    DevClr,
	    IFC
    }
    
    /* <-------------------------- End of gpib_user.h ----------------------------------> */
    
    /* <-------------------------- Start of ib.h ----------------------------------> */
    
    [SimpleType]
    [CCode (cname = "Addr4882_t", has_type_id = false)]
    public struct Addr4882 : uint16 {
    }

    const Addr4882 NOADDR;
    
    /* tells RcvRespMsg() to stop on EOI */
    [CCode (cname = "STOPend")]
    const int STOPEND;
    
    [CCode (cname = "sad_special_address", has_type_id = false)]
    public enum SadSpecialAddress
    {
	    NO_SAD,
	    ALL_SAD
    }

    [CCode (cname = "send_eotmode", has_type_id = false)]
    public enum SendEotmode
    {
	    NULLend,
	    DABend,
	    NLend
    }
    
    public int ibsta;
    public int ibcnt;
    public int iberr;
    public long ibcntl;

    [CCode (cname = "AllSPoll")]
    public void AllSPoll( int board_desc, [CCode (array_length = false)] Addr4882[] addressList, [CCode (array_length = false)] short[] resultList );
    [CCode (cname = "AllSpoll")]
    public void AllSpoll( int board_desc, [CCode (array_length = false)] Addr4882[] addressList, [CCode (array_length = false)] short[] resultList );
    [CCode (cname = "DevClear")]
    public void DevClear( int board_desc, Addr4882 address );
    [CCode (cname = "DevClearList")]
    public void DevClearList( int board_desc, [CCode (array_length = false)] Addr4882[] addressList);
    [CCode (cname = "EnableLocal")]
    public void EnableLocal( int board_desc, [CCode (array_length = false)] Addr4882[] addressList);
    [CCode (cname = "EnableRemote")]
    public void EnableRemote( int board_desc, [CCode (array_length = false)] Addr4882[] addressList);
    [CCode (cname = "FindLstn")]
    public void FindLstn( int board_desc, [CCode (array_length = false)] Addr4882[] padList, Addr4882[] resultList );
    [CCode (cname = "FindRQS")]
    public void FindRQS( int board_desc, [CCode (array_length = false)] Addr4882[] addressList, out short result );
    [CCode (cname = "PassControl")]
    public void PassControl( int board_desc, Addr4882 address );
    [CCode (cname = "PPoll")]
    public void PPoll( int board_desc, out short result );
    [CCode (cname = "PPollConfig")]
    public void PPollConfig( int board_desc, Addr4882 address, int dataLine, int lineSense );
    [CCode (cname = "PPollUnconfig")]
    public void PPollUnconfig( int board_desc, [CCode (array_length = false)] Addr4882[] addressList);
    [CCode (cname = "RcvRespMsg")]
    public void RcvRespMsg( int board_desc, uint8[] buffer, int termination );
    [CCode (cname = "ReadStatusByte")]
    public void ReadStatusByte( int board_desc, Addr4882 address, out short result );
    [CCode (cname = "Receive")]
    public void Receive( int board_desc, Addr4882 address, uint8[] buffer, int eot_mode );
    [CCode (cname = "ReceiveSetup")]
    public void ReceiveSetup( int board_desc, Addr4882 address );
    [CCode (cname = "ResetSys")]  
    public void ResetSys( int board_desc, [CCode (array_length = false)] Addr4882[] addressList );
    [CCode (cname = "Send")]
    public void Send( int board_desc, Addr4882 address, uint8[] buffer, int eot_mode );
    [CCode (cname = "SendCmds")]
    public void SendCmds( int board_desc, uint8[] cmds );
    [CCode (cname = "SendDataBytes")]
    public void SendDataBytes( int board_desc, uint8[] buffer, int eotmode );
    [CCode (cname = "SendIFC")]
    public void SendIFC( int board_desc );
    [CCode (cname = "SendLLO")]
    public void SendLLO( int board_desc );
    [CCode (cname = "SendList")]
    public void SendList( int board_desc, Addr4882[] addressList, uint8[] buffer, int eotmode );
    [CCode (cname = "SendSetup")]
    public void SendSetup( int board_desc, [CCode (array_length = false)] Addr4882[] addressList);
    [CCode (cname = "SetRWLS")]
    public void SetRWLS( int board_desc, [CCode (array_length = false)] Addr4882[] addressList);
    [CCode (cname = "TestSRQ")]
    public void TestSRQ( int board_desc, out short result );
    [CCode (cname = "TestSys")]
    public void TestSys( int board_desc, [CCode (array_length = false)] Addr4882[] addressList, [CCode (array_length = false)] short resultList[] );
    [CCode (cname = "ThreadIbsta")]
    public int ThreadIbsta();
    [CCode (cname = "ThreadIberr")]
    public int ThreadIberr();
    [CCode (cname = "ThreadIbcnt")]
    public int ThreadIbcnt();
    [CCode (cname = "ThreadIbcntl")]
    public long ThreadIbcntl();
    [CCode (cname = "Trigger")]
    public void Trigger( int board_desc, Addr4882 address );
    [CCode (cname = "TriggerList")]
    public void TriggerList( int board_desc, [CCode (array_length = false)] Addr4882[] addressList );
    [CCode (cname = "WaitSRQ")]
    public void WaitSRQ( int board_desc, out short result );
    [CCode (cname = "ibask")]
    public int ibask( int ud, int option, out int val );
    [CCode (cname = "ibbna")]
    public int ibbna( int ud, out char board_name );
    [CCode (cname = "ibcac")]
    public int ibcac( int ud, int synchronous );
    [CCode (cname="ibclr")]
    public int ibclr( int ud );
    [CCode (cname = "ibcmd")]
    public int ibcmd( int ud, uint8[] cmd );
    [CCode (cname = "ibcmda")]
    public int ibcmda( int ud, uint8[] cmd );
    [CCode (cname = "ibconfig")]
    public int ibconfig( int ud, int option, int val );
    [CCode (cname="ibdev")]
    public int ibdev( int board_index, int pad, int sad, int timo, int send_eoi, int eosmode );
    [CCode (cname = "ibdma")]
    public int ibdma( int ud, int v );
    [CCode (cname = "ibeot")]
    public int ibeot( int ud, int v );
    [CCode (cname = "ibeos")]
    public int ibeos( int ud, int v );
    [CCode (cname = "ibevent")]
    public int ibevent( int ud, out short event );
    [CCode (cname = "ibfind")]
    public int ibfind( string dev );
    [CCode (cname = "ibgts")]
    public int ibgts(int ud, int shadow_handshake);
    [CCode (cname = "ibist")]
    public int ibist( int ud, int ist );
    [CCode (cname = "iblines")]
    public int iblines( int ud, out short line_status );
    [CCode (cname = "ibln")]
    public int ibln( int ud, int pad, int sad, out short found_listener );
    [CCode (cname = "ibloc")]
    public int ibloc( int ud );
    [CCode (cname = "ibonl")]
    public int ibonl( int ud, int onl );
    [CCode (cname = "ibpad")]
    public int ibpad( int ud, int v );
    [CCode (cname = "ibpct")]
    public int ibpct( int ud );
    [CCode (cname = "ibppc")]
    public int ibppc( int ud, int v );
    [CCode (cname = "ibrd")]
    public int ibrd( int ud, uint8[] buf );
    [CCode (cname = "ibrda")]
    public int ibrda( int ud, uint8[] buf );
    [CCode (cname = "ibrdf")]
    public int ibrdf( int ud, string file_path );
    [CCode (cname = "ibrpp")]
    public int ibrpp( int ud, out char ppr );
    [CCode (cname = "ibrsc")]
    public int ibrsc( int ud, int v );
    [CCode (cname = "ibrsp")]
    public int ibrsp( int ud, out char spr );
    [CCode (cname = "ibrsv")]
    public int ibrsv( int ud, int v );
    [CCode (cname = "ibsad")]
    public int ibsad( int ud, int v );
    [CCode (cname = "ibsic")]
    public int ibsic( int ud );
    [CCode (cname = "ibsre")]
    public int ibsre( int ud, int v );
    [CCode (cname = "ibstop")]
    public int ibstop( int ud );
    [CCode (cname = "ibtmo")]
    public int ibtmo( int ud, int v );
    [CCode (cname = "ibtrg")]
    public int ibtrg( int ud );
    [CCode (cname = "ibwait")]
    public int ibwait( int ud, int mask );
    [CCode (cname = "ibwrt")]
    public int ibwrt( int ud, uint8[] buf );
    [CCode (cname = "ibwrta")]
    public int ibwrta( int ud, uint8[] buf );
    [CCode (cname = "ibwrtf")]
    public int ibwrtf( int ud, string file_path );
    [CCode (cname = "gpib_error_string")]
    public string error_string( int iberr );

    static Addr4882 MakeAddr( uint pad, uint sad );
    
    static uint GetPAD( Addr4882 address );
    
    static uint GetSAD( Addr4882 address );
    /* <-------------------------- End of ib.h ----------------------------------> */
}
