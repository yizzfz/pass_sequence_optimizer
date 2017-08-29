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
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
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
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge36

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count66 = zext i32 %0 to i64
  %10 = insertelement <2 x double> undef, double %9, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter46 = and i32 %1, 1
  %lcmp.mod47 = icmp eq i32 %xtraiter46, 0
  %12 = icmp eq i32 %1, 1
  %wide.trip.count54 = zext i32 %0 to i64
  %wide.trip.count45.1 = zext i32 %1 to i64
  %13 = insertelement <2 x double> undef, double %9, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = insertelement <2 x double> undef, double %8, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge32.us, %.preheader.us.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next53, %._crit_edge32.us ]
  %17 = add nuw i64 %indvars.iv52, 4294967295
  %18 = icmp sgt i64 %indvars.iv52, 0
  br i1 %18, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %._crit_edge37.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %._crit_edge37.us.prol.loopexit, %.preheader.us
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv52, i64 %indvars.iv52
  store double 1.000000e+00, double* %19, align 8
  %20 = trunc i64 %indvars.iv52 to i32
  %21 = add i32 %20, %1
  br i1 %lcmp.mod47, label %._crit_edge39.us.prol.loopexit, label %._crit_edge39.us.prol

._crit_edge39.us.prol:                            ; preds = %._crit_edge.us
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 0
  store double %24, double* %25, align 8
  br label %._crit_edge39.us.prol.loopexit

._crit_edge39.us.prol.loopexit:                   ; preds = %._crit_edge.us, %._crit_edge39.us.prol
  %indvars.iv43.unr.ph = phi i64 [ 1, %._crit_edge39.us.prol ], [ 0, %._crit_edge.us ]
  br i1 %12, label %._crit_edge32.us, label %._crit_edge39.us.preheader

._crit_edge39.us.preheader:                       ; preds = %._crit_edge39.us.prol.loopexit
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %._crit_edge39.us.preheader, %._crit_edge39.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.1, %._crit_edge39.us ], [ %indvars.iv43.unr.ph, %._crit_edge39.us.preheader ]
  %26 = trunc i64 %indvars.iv43 to i32
  %27 = sub i32 %21, %26
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv43
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %31 = trunc i64 %indvars.iv.next44 to i32
  %32 = sub i32 %21, %31
  %33 = srem i32 %32, %1
  %34 = sitofp i32 %33 to double
  %35 = insertelement <2 x double> undef, double %29, i32 0
  %36 = insertelement <2 x double> %35, double %34, i32 1
  %37 = fdiv <2 x double> %36, %16
  %38 = bitcast double* %30 to <2 x double>*
  store <2 x double> %37, <2 x double>* %38, align 8
  %indvars.iv.next44.1 = add nuw nsw i64 %indvars.iv43, 2
  %exitcond.149 = icmp eq i64 %indvars.iv.next44.1, %wide.trip.count45.1
  br i1 %exitcond.149, label %._crit_edge32.us.loopexit, label %._crit_edge39.us

._crit_edge37.us:                                 ; preds = %._crit_edge37.us.preheader, %._crit_edge37.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge37.us ], [ %indvars.iv.unr.ph, %._crit_edge37.us.preheader ]
  %39 = add nuw nsw i64 %indvars.iv, %indvars.iv52
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %0
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv52, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = add nuw nsw i64 %indvars.iv.next, %indvars.iv52
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %0
  %47 = sitofp i32 %46 to double
  %48 = insertelement <2 x double> undef, double %42, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fdiv <2 x double> %49, %14
  %51 = bitcast double* %43 to <2 x double>*
  store <2 x double> %50, <2 x double>* %51, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv52
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %._crit_edge37.us

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter69 = and i64 %indvars.iv52, 1
  %lcmp.mod = icmp eq i64 %xtraiter69, 0
  br i1 %lcmp.mod, label %._crit_edge37.us.prol.loopexit, label %._crit_edge37.us.prol

._crit_edge37.us.prol:                            ; preds = %.lr.ph.us
  %52 = trunc i64 %indvars.iv52 to i32
  %53 = srem i32 %52, %0
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %54, %9
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv52, i64 0
  store double %55, double* %56, align 8
  br label %._crit_edge37.us.prol.loopexit

._crit_edge37.us.prol.loopexit:                   ; preds = %.lr.ph.us, %._crit_edge37.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge37.us.prol ], [ 0, %.lr.ph.us ]
  %57 = trunc i64 %17 to i32
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %._crit_edge.us, label %._crit_edge37.us.preheader

._crit_edge37.us.preheader:                       ; preds = %._crit_edge37.us.prol.loopexit
  br label %._crit_edge37.us

._crit_edge32.us.loopexit:                        ; preds = %._crit_edge39.us
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.loopexit, %._crit_edge39.us.prol.loopexit
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond, label %._crit_edge36.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader._crit_edge, %.preheader.preheader
  %indvars.iv64 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next65, %.preheader._crit_edge ]
  %59 = add nuw i64 %indvars.iv64, 4294967295
  %60 = icmp sgt i64 %indvars.iv64, 0
  br i1 %60, label %.lr.ph, label %.preheader._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter6068 = and i64 %indvars.iv64, 1
  %lcmp.mod61 = icmp eq i64 %xtraiter6068, 0
  br i1 %lcmp.mod61, label %._crit_edge37.prol.loopexit, label %._crit_edge37.prol

._crit_edge37.prol:                               ; preds = %.lr.ph
  %61 = trunc i64 %indvars.iv64 to i32
  %62 = srem i32 %61, %0
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, %9
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv64, i64 0
  store double %64, double* %65, align 8
  br label %._crit_edge37.prol.loopexit

._crit_edge37.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge37.prol
  %indvars.iv55.unr.ph = phi i64 [ 1, %._crit_edge37.prol ], [ 0, %.lr.ph ]
  %66 = trunc i64 %59 to i32
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %.preheader._crit_edge, label %._crit_edge37.preheader

._crit_edge37.preheader:                          ; preds = %._crit_edge37.prol.loopexit
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.preheader, %._crit_edge37
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %._crit_edge37 ], [ %indvars.iv55.unr.ph, %._crit_edge37.preheader ]
  %68 = add nuw nsw i64 %indvars.iv55, %indvars.iv64
  %69 = trunc i64 %68 to i32
  %70 = srem i32 %69, %0
  %71 = sitofp i32 %70 to double
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv64, i64 %indvars.iv55
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %73 = add nuw nsw i64 %indvars.iv.next56, %indvars.iv64
  %74 = trunc i64 %73 to i32
  %75 = srem i32 %74, %0
  %76 = sitofp i32 %75 to double
  %77 = insertelement <2 x double> undef, double %71, i32 0
  %78 = insertelement <2 x double> %77, double %76, i32 1
  %79 = fdiv <2 x double> %78, %11
  %80 = bitcast double* %72 to <2 x double>*
  store <2 x double> %79, <2 x double>* %80, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next56.1, %indvars.iv64
  br i1 %exitcond59.1, label %.preheader._crit_edge.loopexit, label %._crit_edge37

.preheader._crit_edge.loopexit:                   ; preds = %._crit_edge37
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %._crit_edge37.prol.loopexit, %.preheader
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv64, i64 %indvars.iv64
  store double 1.000000e+00, double* %81, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %._crit_edge36.loopexit72, label %.preheader

._crit_edge36.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge36

._crit_edge36.loopexit72:                         ; preds = %.preheader._crit_edge
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36.loopexit72, %._crit_edge36.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader27.us.preheader, label %._crit_edge32

.preheader27.us.preheader:                        ; preds = %5
  %8 = add i32 %1, -1
  %9 = add i32 %0, 1
  %10 = add i32 %0, -2
  %11 = sext i32 %0 to i64
  %wide.trip.count57 = zext i32 %1 to i64
  %wide.trip.count51.1 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp ult i32 %8, 3
  %13 = add nsw i32 %xtraiter, -1
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  %16 = add nsw i64 %wide.trip.count57, -4
  %17 = insertelement <2 x double> undef, double %2, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = insertelement <2 x double> undef, double %2, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x double> undef, double %2, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %..loopexit_crit_edge.us..preheader27.us_crit_edge, %.preheader27.us.preheader
  %indvars.iv58 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next59, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv47 = phi i64 [ 1, %.preheader27.us.preheader ], [ %indvars.iv.next48, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %23 = icmp slt i64 %indvars.iv.next59, %11
  br i1 %23, label %.preheader.us.us.preheader, label %.preheader.us34.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader27.us
  %24 = sub nsw i64 0, %indvars.iv58
  %25 = trunc i64 %24 to i32
  %26 = add i32 %9, %25
  %xtraiter52 = and i32 %26, 1
  %lcmp.mod53 = icmp eq i32 %xtraiter52, 0
  %27 = sub i32 0, %25
  %28 = icmp eq i32 %10, %27
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 %indvars.iv58
  %indvars.iv.next50.prol = add nuw nsw i64 %indvars.iv47, 1
  br label %.preheader.us.us

.preheader.us34.preheader:                        ; preds = %.preheader27.us
  br i1 %lcmp.mod, label %.preheader.us34.prol.loopexit, label %.preheader.us34.prol.preheader

.preheader.us34.prol.preheader:                   ; preds = %.preheader.us34.preheader
  br label %.preheader.us34.prol

.preheader.us34.prol:                             ; preds = %.preheader.us34.prol.preheader, %.preheader.us34.prol..preheader.us34.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us34.prol..preheader.us34.prol_crit_edge ], [ 0, %.preheader.us34.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader.us34.prol..preheader.us34.prol_crit_edge ], [ %xtraiter, %.preheader.us34.prol.preheader ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv.prol
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %2
  store double %32, double* %30, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us34.prol.loopexit.loopexit, label %.preheader.us34.prol..preheader.us34.prol_crit_edge, !llvm.loop !1

.preheader.us34.prol..preheader.us34.prol_crit_edge: ; preds = %.preheader.us34.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.preheader.us34.prol

.preheader.us34.prol.loopexit.loopexit:           ; preds = %.preheader.us34.prol
  br label %.preheader.us34.prol.loopexit

.preheader.us34.prol.loopexit:                    ; preds = %.preheader.us34.prol.loopexit.loopexit, %.preheader.us34.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us34.preheader ], [ %15, %.preheader.us34.prol.loopexit.loopexit ]
  br i1 %12, label %..loopexit_crit_edge.us, label %.preheader.us34.preheader68

.preheader.us34.preheader68:                      ; preds = %.preheader.us34.prol.loopexit
  %33 = sub nsw i64 %16, %indvars.iv.unr
  %34 = lshr i64 %33, 2
  %35 = and i64 %34, 1
  %lcmp.mod73 = icmp eq i64 %35, 0
  br i1 %lcmp.mod73, label %.preheader.us34.prol.preheader70, label %.preheader.us34.prol.loopexit71.unr-lcssa

.preheader.us34.prol.preheader70:                 ; preds = %.preheader.us34.preheader68
  br label %.preheader.us34.prol74

.preheader.us34.prol74:                           ; preds = %.preheader.us34.prol.preheader70
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv.unr
  %37 = bitcast double* %36 to <2 x double>*
  %38 = load <2 x double>, <2 x double>* %37, align 8
  %39 = fmul <2 x double> %38, %18
  store <2 x double> %39, <2 x double>* %37, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv.next.1.prol
  %41 = bitcast double* %40 to <2 x double>*
  %42 = load <2 x double>, <2 x double>* %41, align 8
  %43 = fmul <2 x double> %42, %18
  store <2 x double> %43, <2 x double>* %41, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %.preheader.us34.prol.loopexit71.unr-lcssa

.preheader.us34.prol.loopexit71.unr-lcssa:        ; preds = %.preheader.us34.preheader68, %.preheader.us34.prol74
  %indvars.iv.unr76.ph = phi i64 [ %indvars.iv.next.3.prol, %.preheader.us34.prol74 ], [ %indvars.iv.unr, %.preheader.us34.preheader68 ]
  br label %.preheader.us34.prol.loopexit71

.preheader.us34.prol.loopexit71:                  ; preds = %.preheader.us34.prol.loopexit71.unr-lcssa
  %44 = icmp eq i64 %34, 0
  br i1 %44, label %..loopexit_crit_edge.us.loopexit69, label %.preheader.us34.preheader68.new

.preheader.us34.preheader68.new:                  ; preds = %.preheader.us34.prol.loopexit71
  br label %.preheader.us34

.preheader.us34:                                  ; preds = %.preheader.us34, %.preheader.us34.preheader68.new
  %indvars.iv = phi i64 [ %indvars.iv.unr76.ph, %.preheader.us34.preheader68.new ], [ %indvars.iv.next.3.1, %.preheader.us34 ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv
  %46 = bitcast double* %45 to <2 x double>*
  %47 = load <2 x double>, <2 x double>* %46, align 8
  %48 = fmul <2 x double> %47, %20
  store <2 x double> %48, <2 x double>* %46, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv.next.1
  %50 = bitcast double* %49 to <2 x double>*
  %51 = load <2 x double>, <2 x double>* %50, align 8
  %52 = fmul <2 x double> %51, %20
  store <2 x double> %52, <2 x double>* %50, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv.next.3
  %54 = bitcast double* %53 to <2 x double>*
  %55 = load <2 x double>, <2 x double>* %54, align 8
  %56 = fmul <2 x double> %55, %22
  store <2 x double> %56, <2 x double>* %54, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv.next.1.1
  %58 = bitcast double* %57 to <2 x double>*
  %59 = load <2 x double>, <2 x double>* %58, align 8
  %60 = fmul <2 x double> %59, %22
  store <2 x double> %60, <2 x double>* %58, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count57
  br i1 %exitcond.3.1, label %..loopexit_crit_edge.us.loopexit69.unr-lcssa, label %.preheader.us34

..loopexit_crit_edge.us.loopexit:                 ; preds = %._crit_edge.us.us
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us.loopexit69.unr-lcssa:     ; preds = %.preheader.us34
  br label %..loopexit_crit_edge.us.loopexit69

..loopexit_crit_edge.us.loopexit69:               ; preds = %.preheader.us34.prol.loopexit71, %..loopexit_crit_edge.us.loopexit69.unr-lcssa
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit69, %..loopexit_crit_edge.us.loopexit, %.preheader.us34.prol.loopexit
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count51.1
  br i1 %exitcond61, label %._crit_edge32.loopexit, label %..loopexit_crit_edge.us..preheader27.us_crit_edge

..loopexit_crit_edge.us..preheader27.us_crit_edge: ; preds = %..loopexit_crit_edge.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  br label %.preheader27.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv55 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next56, %._crit_edge.us.us ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv55
  br i1 %lcmp.mod53, label %._crit_edge33.us.us.prol.loopexit, label %._crit_edge33.us.us.prol

._crit_edge33.us.us.prol:                         ; preds = %.preheader.us.us
  %62 = load double, double* %29, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv47, i64 %indvars.iv55
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = load double, double* %61, align 8
  %67 = fadd double %66, %65
  store double %67, double* %61, align 8
  br label %._crit_edge33.us.us.prol.loopexit

._crit_edge33.us.us.prol.loopexit:                ; preds = %.preheader.us.us, %._crit_edge33.us.us.prol
  %indvars.iv49.unr.ph = phi i64 [ %indvars.iv.next50.prol, %._crit_edge33.us.us.prol ], [ %indvars.iv47, %.preheader.us.us ]
  %.pre67 = load double, double* %61, align 8
  br i1 %28, label %._crit_edge.us.us, label %._crit_edge33.us.us.preheader

._crit_edge33.us.us.preheader:                    ; preds = %._crit_edge33.us.us.prol.loopexit
  br label %._crit_edge33.us.us

._crit_edge.us.us.loopexit:                       ; preds = %._crit_edge33.us.us
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %._crit_edge33.us.us.prol.loopexit
  %68 = phi double [ %.pre67, %._crit_edge33.us.us.prol.loopexit ], [ %82, %._crit_edge.us.us.loopexit ]
  %69 = fmul double %68, %2
  store double %69, double* %61, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond = icmp eq i64 %indvars.iv.next56, %wide.trip.count57
  br i1 %exitcond, label %..loopexit_crit_edge.us.loopexit, label %.preheader.us.us

._crit_edge33.us.us:                              ; preds = %._crit_edge33.us.us.preheader, %._crit_edge33.us.us
  %70 = phi double [ %82, %._crit_edge33.us.us ], [ %.pre67, %._crit_edge33.us.us.preheader ]
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %._crit_edge33.us.us ], [ %indvars.iv49.unr.ph, %._crit_edge33.us.us.preheader ]
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv58
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv55
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fadd double %70, %75
  store double %76, double* %61, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next50, i64 %indvars.iv58
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next50, i64 %indvars.iv55
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %76, %81
  store double %82, double* %61, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next50.1, %wide.trip.count51.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %._crit_edge33.us.us

._crit_edge32.loopexit:                           ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count21 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next20, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv19, %10
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge16.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge16.us ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge16.us

; <label>:16:                                     ; preds = %._crit_edge17.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge17.us, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge17.us

._crit_edge.us:                                   ; preds = %._crit_edge16.us
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
