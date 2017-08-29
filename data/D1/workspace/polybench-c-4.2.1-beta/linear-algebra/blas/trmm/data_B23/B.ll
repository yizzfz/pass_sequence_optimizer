; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge35

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count62 = zext i32 %0 to i64
  %10 = insertelement <2 x double> undef, double %9, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %12 = and i32 %1, 1
  %lcmp.mod65 = icmp eq i32 %12, 0
  %13 = icmp eq i32 %1, 1
  %wide.trip.count53 = zext i32 %0 to i64
  %wide.trip.count49.1 = zext i32 %1 to i64
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %8, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge32.us, %.preheader.us.preheader
  %indvars.iv51 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next52, %._crit_edge32.us ]
  %18 = icmp sgt i64 %indvars.iv51, 0
  br i1 %18, label %.lr.ph.us.preheader, label %.preheader.us._crit_edge

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv51, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit, label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.preheader
  %19 = trunc i64 %indvars.iv51 to i32
  %20 = srem i32 %19, %0
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %9
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv51, i64 0
  store double %22, double* %23, align 8
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.preheader, %.lr.ph.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.preheader ]
  %24 = icmp eq i64 %indvars.iv51, 1
  br i1 %24, label %.preheader.us._crit_edge, label %.lr.ph.us.preheader74

.lr.ph.us.preheader74:                            ; preds = %.lr.ph.us.prol.loopexit
  br label %.lr.ph.us

.preheader.us._crit_edge.loopexit:                ; preds = %.lr.ph.us
  br label %.preheader.us._crit_edge

.preheader.us._crit_edge:                         ; preds = %.preheader.us._crit_edge.loopexit, %.lr.ph.us.prol.loopexit, %.preheader.us
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv51
  store double 1.000000e+00, double* %25, align 8
  %26 = trunc i64 %indvars.iv51 to i32
  %27 = add i32 %26, %1
  br i1 %lcmp.mod65, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us._crit_edge
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 0
  store double %30, double* %31, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us._crit_edge, %.prol.preheader
  %indvars.iv47.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us._crit_edge ]
  br i1 %13, label %._crit_edge32.us, label %.preheader.us._crit_edge.new.preheader

.preheader.us._crit_edge.new.preheader:           ; preds = %.prol.loopexit
  br label %.preheader.us._crit_edge.new

.preheader.us._crit_edge.new:                     ; preds = %.preheader.us._crit_edge.new.preheader, %.preheader.us._crit_edge.new
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %.preheader.us._crit_edge.new ], [ %indvars.iv47.unr.ph, %.preheader.us._crit_edge.new.preheader ]
  %32 = trunc i64 %indvars.iv47 to i32
  %33 = sub i32 %27, %32
  %34 = srem i32 %33, %1
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv47
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %37 = trunc i64 %indvars.iv.next48 to i32
  %38 = sub i32 %27, %37
  %39 = srem i32 %38, %1
  %40 = sitofp i32 %39 to double
  %41 = insertelement <2 x double> undef, double %35, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fdiv <2 x double> %42, %17
  %44 = bitcast double* %36 to <2 x double>*
  store <2 x double> %43, <2 x double>* %44, align 8
  %indvars.iv.next48.1 = add nuw nsw i64 %indvars.iv47, 2
  %exitcond50.1 = icmp eq i64 %indvars.iv.next48.1, %wide.trip.count49.1
  br i1 %exitcond50.1, label %._crit_edge32.us.loopexit, label %.preheader.us._crit_edge.new

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader74, %.lr.ph.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us ], [ %indvars.iv.unr.ph, %.lr.ph.us.preheader74 ]
  %45 = add nuw nsw i64 %indvars.iv, %indvars.iv51
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, %0
  %48 = sitofp i32 %47 to double
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = add nuw nsw i64 %indvars.iv.next, %indvars.iv51
  %51 = trunc i64 %50 to i32
  %52 = srem i32 %51, %0
  %53 = sitofp i32 %52 to double
  %54 = insertelement <2 x double> undef, double %48, i32 0
  %55 = insertelement <2 x double> %54, double %53, i32 1
  %56 = fdiv <2 x double> %55, %15
  %57 = bitcast double* %49 to <2 x double>*
  store <2 x double> %56, <2 x double>* %57, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv51
  br i1 %exitcond.1, label %.preheader.us._crit_edge.loopexit, label %.lr.ph.us

._crit_edge32.us.loopexit:                        ; preds = %.preheader.us._crit_edge.new
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.loopexit, %.prol.loopexit
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, %wide.trip.count53
  br i1 %exitcond54, label %._crit_edge35.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader._crit_edge, %.preheader.preheader
  %indvars.iv60 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next61, %.preheader._crit_edge ]
  %58 = icmp sgt i64 %indvars.iv60, 0
  br i1 %58, label %.lr.ph.preheader, label %.preheader._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter66 = and i64 %indvars.iv60, 1
  %lcmp.mod67 = icmp eq i64 %xtraiter66, 0
  br i1 %lcmp.mod67, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %59 = trunc i64 %indvars.iv60 to i32
  %60 = srem i32 %59, %0
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %61, %9
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv60, i64 0
  store double %62, double* %63, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv55.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %64 = icmp eq i64 %indvars.iv60, 1
  br i1 %64, label %.preheader._crit_edge, label %.lr.ph.preheader75

.lr.ph.preheader75:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader75, %.lr.ph
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph ], [ %indvars.iv55.unr.ph, %.lr.ph.preheader75 ]
  %65 = add nuw nsw i64 %indvars.iv55, %indvars.iv60
  %66 = trunc i64 %65 to i32
  %67 = srem i32 %66, %0
  %68 = sitofp i32 %67 to double
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv60, i64 %indvars.iv55
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %70 = add nuw nsw i64 %indvars.iv.next56, %indvars.iv60
  %71 = trunc i64 %70 to i32
  %72 = srem i32 %71, %0
  %73 = sitofp i32 %72 to double
  %74 = insertelement <2 x double> undef, double %68, i32 0
  %75 = insertelement <2 x double> %74, double %73, i32 1
  %76 = fdiv <2 x double> %75, %11
  %77 = bitcast double* %69 to <2 x double>*
  store <2 x double> %76, <2 x double>* %77, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next56.1, %indvars.iv60
  br i1 %exitcond59.1, label %.preheader._crit_edge.loopexit, label %.lr.ph

.preheader._crit_edge.loopexit:                   ; preds = %.lr.ph
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv60, i64 %indvars.iv60
  store double 1.000000e+00, double* %78, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, %wide.trip.count62
  br i1 %exitcond63, label %._crit_edge35.loopexit76, label %.preheader

._crit_edge35.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge35

._crit_edge35.loopexit76:                         ; preds = %.preheader._crit_edge
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit76, %._crit_edge35.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader27.us.preheader, label %._crit_edge31

.preheader27.us.preheader:                        ; preds = %5
  %8 = sext i32 %0 to i64
  %9 = zext i32 %1 to i64
  %10 = add nsw i64 %9, -1
  %11 = zext i32 %0 to i64
  %12 = add nuw nsw i64 %11, 1
  %13 = add nsw i64 %11, -2
  %xtraiter = and i64 %9, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %14 = icmp ult i64 %10, 3
  %15 = add nsw i64 %9, -4
  %16 = insertelement <2 x double> undef, double %2, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = insertelement <2 x double> undef, double %2, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = insertelement <2 x double> undef, double %2, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %..loopexit_crit_edge.us..preheader27.us_crit_edge, %.preheader27.us.preheader
  %indvars.iv71 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next72, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv61 = phi i64 [ 1, %.preheader27.us.preheader ], [ %indvars.iv.next62, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %22 = icmp slt i64 %indvars.iv.next72, %8
  br i1 %22, label %.preheader.us.us.preheader, label %.preheader.us32.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader27.us
  %23 = sub i64 %12, %indvars.iv71
  %xtraiter76 = and i64 %23, 1
  %lcmp.mod77 = icmp eq i64 %xtraiter76, 0
  %24 = icmp eq i64 %13, %indvars.iv71
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv61, i64 %indvars.iv71
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv61, 1
  br label %.preheader.us.us

.preheader.us32.preheader:                        ; preds = %.preheader27.us
  br i1 %lcmp.mod, label %.preheader.us32.prol.loopexit, label %.preheader.us32.prol.preheader

.preheader.us32.prol.preheader:                   ; preds = %.preheader.us32.preheader
  br label %.preheader.us32.prol

.preheader.us32.prol:                             ; preds = %.preheader.us32.prol.preheader, %.preheader.us32.prol..preheader.us32.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ 0, %.preheader.us32.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ %xtraiter, %.preheader.us32.prol.preheader ]
  %.phi.trans.insert40.prol = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %indvars.iv.prol
  %.pre.prol = load double, double* %.phi.trans.insert40.prol, align 8
  %26 = fmul double %.pre.prol, %2
  store double %26, double* %.phi.trans.insert40.prol, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us32.prol.loopexit.loopexit, label %.preheader.us32.prol..preheader.us32.prol_crit_edge, !llvm.loop !1

.preheader.us32.prol..preheader.us32.prol_crit_edge: ; preds = %.preheader.us32.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.preheader.us32.prol

.preheader.us32.prol.loopexit.loopexit:           ; preds = %.preheader.us32.prol
  br label %.preheader.us32.prol.loopexit

.preheader.us32.prol.loopexit:                    ; preds = %.preheader.us32.prol.loopexit.loopexit, %.preheader.us32.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us32.preheader ], [ %xtraiter, %.preheader.us32.prol.loopexit.loopexit ]
  br i1 %14, label %..loopexit_crit_edge.us, label %.preheader.us32.preheader86

.preheader.us32.preheader86:                      ; preds = %.preheader.us32.prol.loopexit
  %27 = sub nsw i64 %15, %indvars.iv.unr
  %28 = lshr i64 %27, 2
  %29 = and i64 %28, 1
  %lcmp.mod92 = icmp eq i64 %29, 0
  br i1 %lcmp.mod92, label %.preheader.us32.prol.preheader89, label %.preheader.us32.prol.loopexit90.unr-lcssa

.preheader.us32.prol.preheader89:                 ; preds = %.preheader.us32.preheader86
  br label %.preheader.us32.prol93

.preheader.us32.prol93:                           ; preds = %.preheader.us32.prol.preheader89
  %.phi.trans.insert40.prol95 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %indvars.iv.unr
  %.pre.v.i0.prol = bitcast double* %.phi.trans.insert40.prol95 to <2 x double>*
  %.pre.prol96 = load <2 x double>, <2 x double>* %.pre.v.i0.prol, align 8
  %30 = fmul <2 x double> %.pre.prol96, %17
  store <2 x double> %30, <2 x double>* %.pre.v.i0.prol, align 8
  %indvars.iv.next.1.prol = add nuw nsw i64 %indvars.iv.unr, 2
  %.phi.trans.insert40.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %indvars.iv.next.1.prol
  %.pre.2.v.i0.prol = bitcast double* %.phi.trans.insert40.2.prol to <2 x double>*
  %.pre.2.prol = load <2 x double>, <2 x double>* %.pre.2.v.i0.prol, align 8
  %31 = fmul <2 x double> %.pre.2.prol, %17
  store <2 x double> %31, <2 x double>* %.pre.2.v.i0.prol, align 8
  %indvars.iv.next.3.prol = or i64 %indvars.iv.unr, 4
  br label %.preheader.us32.prol.loopexit90.unr-lcssa

.preheader.us32.prol.loopexit90.unr-lcssa:        ; preds = %.preheader.us32.preheader86, %.preheader.us32.prol93
  %indvars.iv.unr97.ph = phi i64 [ %indvars.iv.next.3.prol, %.preheader.us32.prol93 ], [ %indvars.iv.unr, %.preheader.us32.preheader86 ]
  br label %.preheader.us32.prol.loopexit90

.preheader.us32.prol.loopexit90:                  ; preds = %.preheader.us32.prol.loopexit90.unr-lcssa
  %32 = icmp eq i64 %28, 0
  br i1 %32, label %..loopexit_crit_edge.us.loopexit87, label %.preheader.us32.preheader86.new

.preheader.us32.preheader86.new:                  ; preds = %.preheader.us32.prol.loopexit90
  br label %.preheader.us32

.preheader.us32:                                  ; preds = %.preheader.us32, %.preheader.us32.preheader86.new
  %indvars.iv = phi i64 [ %indvars.iv.unr97.ph, %.preheader.us32.preheader86.new ], [ %indvars.iv.next.3.1, %.preheader.us32 ]
  %.phi.trans.insert40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %indvars.iv
  %.pre.v.i0 = bitcast double* %.phi.trans.insert40 to <2 x double>*
  %.pre = load <2 x double>, <2 x double>* %.pre.v.i0, align 8
  %33 = fmul <2 x double> %.pre, %19
  store <2 x double> %33, <2 x double>* %.pre.v.i0, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %.phi.trans.insert40.2 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %indvars.iv.next.1
  %.pre.2.v.i0 = bitcast double* %.phi.trans.insert40.2 to <2 x double>*
  %.pre.2 = load <2 x double>, <2 x double>* %.pre.2.v.i0, align 8
  %34 = fmul <2 x double> %.pre.2, %19
  store <2 x double> %34, <2 x double>* %.pre.2.v.i0, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %.phi.trans.insert40.1 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %indvars.iv.next.3
  %.pre.v.i0.1 = bitcast double* %.phi.trans.insert40.1 to <2 x double>*
  %.pre.1 = load <2 x double>, <2 x double>* %.pre.v.i0.1, align 8
  %35 = fmul <2 x double> %.pre.1, %21
  store <2 x double> %35, <2 x double>* %.pre.v.i0.1, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %.phi.trans.insert40.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %indvars.iv.next.1.1
  %.pre.2.v.i0.1 = bitcast double* %.phi.trans.insert40.2.1 to <2 x double>*
  %.pre.2.1 = load <2 x double>, <2 x double>* %.pre.2.v.i0.1, align 8
  %36 = fmul <2 x double> %.pre.2.1, %21
  store <2 x double> %36, <2 x double>* %.pre.2.v.i0.1, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %9
  br i1 %exitcond.3.1, label %..loopexit_crit_edge.us.loopexit87.unr-lcssa, label %.preheader.us32

..loopexit_crit_edge.us.loopexit:                 ; preds = %._crit_edge.us.us
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us.loopexit87.unr-lcssa:     ; preds = %.preheader.us32
  br label %..loopexit_crit_edge.us.loopexit87

..loopexit_crit_edge.us.loopexit87:               ; preds = %.preheader.us32.prol.loopexit90, %..loopexit_crit_edge.us.loopexit87.unr-lcssa
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit87, %..loopexit_crit_edge.us.loopexit, %.preheader.us32.prol.loopexit
  %exitcond74 = icmp eq i64 %indvars.iv.next72, %11
  br i1 %exitcond74, label %._crit_edge31.loopexit, label %..loopexit_crit_edge.us..preheader27.us_crit_edge

..loopexit_crit_edge.us..preheader27.us_crit_edge: ; preds = %..loopexit_crit_edge.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  br label %.preheader27.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv67 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next68, %._crit_edge.us.us ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %indvars.iv67
  %.pre41 = load double, double* %37, align 8
  br i1 %lcmp.mod77, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %38 = load double, double* %25, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv61, i64 %indvars.iv67
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %.pre41, %41
  store double %42, double* %37, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us, %.prol.preheader
  %indvars.iv63.unr.ph = phi i64 [ %indvars.iv.next64.prol, %.prol.preheader ], [ %indvars.iv61, %.preheader.us.us ]
  %.unr.ph = phi double [ %42, %.prol.preheader ], [ %.pre41, %.preheader.us.us ]
  %.lcssa.unr.ph = phi double [ %42, %.prol.preheader ], [ undef, %.preheader.us.us ]
  br i1 %24, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %56, %._crit_edge.us.us.loopexit ]
  %43 = fmul double %.lcssa, %2
  store double %43, double* %37, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, %9
  br i1 %exitcond70, label %..loopexit_crit_edge.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %.preheader.us.us.new ], [ %indvars.iv63.unr.ph, %.preheader.us.us.new.preheader ]
  %44 = phi double [ %56, %.preheader.us.us.new ], [ %.unr.ph, %.preheader.us.us.new.preheader ]
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv63, i64 %indvars.iv71
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv63, i64 %indvars.iv67
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %44, %49
  store double %50, double* %37, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next64, i64 %indvars.iv71
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next64, i64 %indvars.iv67
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %50, %55
  store double %56, double* %37, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %exitcond66.1 = icmp eq i64 %indvars.iv.next64.1, %11
  br i1 %exitcond66.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge31.loopexit:                           ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count18 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv16, %10
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge21
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
