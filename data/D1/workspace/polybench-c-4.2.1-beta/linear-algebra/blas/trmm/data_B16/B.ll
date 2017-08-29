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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
define internal fastcc void @init_array(i32, i32, double*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge35

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  %10 = insertelement <2 x double> undef, double %9, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count66 = zext i32 %0 to i64
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter44 = and i32 %1, 1
  %lcmp.mod45 = icmp eq i32 %xtraiter44, 0
  %12 = icmp eq i32 %1, 1
  %wide.trip.count52 = zext i32 %0 to i64
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %wide.trip.count41.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge32.us, %.preheader.us.preheader
  %indvars.iv50 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next51, %._crit_edge32.us ]
  %15 = add nuw i64 %indvars.iv50, 4294967295
  %16 = icmp sgt i64 %indvars.iv50, 0
  br i1 %16, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv50, i64 %indvars.iv50
  store double 1.000000e+00, double* %17, align 8
  %18 = trunc i64 %indvars.iv50 to i32
  %19 = add i32 %18, %1
  br i1 %lcmp.mod45, label %.prol.loopexit43, label %.prol.preheader42

.prol.preheader42:                                ; preds = %._crit_edge.us
  %20 = srem i32 %19, %1
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 0
  store double %22, double* %23, align 8
  br label %.prol.loopexit43

.prol.loopexit43:                                 ; preds = %._crit_edge.us, %.prol.preheader42
  %indvars.iv39.unr.ph = phi i64 [ 1, %.prol.preheader42 ], [ 0, %._crit_edge.us ]
  br i1 %12, label %._crit_edge32.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit43
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.1, %._crit_edge.us.new ], [ %indvars.iv39.unr.ph, %._crit_edge.us.new.preheader ]
  %24 = trunc i64 %indvars.iv39 to i32
  %25 = sub i32 %19, %24
  %26 = srem i32 %25, %1
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv39
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %29 = trunc i64 %indvars.iv.next40 to i32
  %30 = sub i32 %19, %29
  %31 = srem i32 %30, %1
  %32 = sitofp i32 %31 to double
  %33 = insertelement <2 x double> undef, double %27, i32 0
  %34 = insertelement <2 x double> %33, double %32, i32 1
  %35 = fdiv <2 x double> %34, %14
  %36 = bitcast double* %28 to <2 x double>*
  store <2 x double> %35, <2 x double>* %36, align 8
  %indvars.iv.next40.1 = add nuw nsw i64 %indvars.iv39, 2
  %exitcond.147 = icmp eq i64 %indvars.iv.next40.1, %wide.trip.count41.1
  br i1 %exitcond.147, label %._crit_edge32.us.loopexit, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %37 = add nuw nsw i64 %indvars.iv, %indvars.iv50
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %0
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv50, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = add nuw nsw i64 %indvars.iv.next, %indvars.iv50
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %0
  %45 = sitofp i32 %44 to double
  %46 = insertelement <2 x double> undef, double %40, i32 0
  %47 = insertelement <2 x double> %46, double %45, i32 1
  %48 = fdiv <2 x double> %47, %11
  %49 = bitcast double* %41 to <2 x double>*
  store <2 x double> %48, <2 x double>* %49, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv50
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter69 = and i64 %indvars.iv50, 1
  %lcmp.mod = icmp eq i64 %xtraiter69, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %50 = trunc i64 %indvars.iv50 to i32
  %51 = srem i32 %50, %0
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, %9
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv50, i64 0
  store double %53, double* %54, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %55 = trunc i64 %15 to i32
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge32.us.loopexit:                        ; preds = %._crit_edge.us.new
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.loopexit, %.prol.loopexit43
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond, label %._crit_edge35.loopexit, label %.preheader.us

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv64 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next65, %._crit_edge ]
  %57 = add nuw i64 %indvars.iv64, 4294967295
  %58 = icmp sgt i64 %indvars.iv64, 0
  br i1 %58, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter6068 = and i64 %indvars.iv64, 1
  %lcmp.mod61 = icmp eq i64 %xtraiter6068, 0
  br i1 %lcmp.mod61, label %.prol.loopexit59, label %.prol.preheader58

.prol.preheader58:                                ; preds = %.lr.ph
  %59 = trunc i64 %indvars.iv64 to i32
  %60 = srem i32 %59, %0
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %61, %9
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv64, i64 0
  store double %62, double* %63, align 8
  br label %.prol.loopexit59

.prol.loopexit59:                                 ; preds = %.lr.ph, %.prol.preheader58
  %indvars.iv53.unr.ph = phi i64 [ 1, %.prol.preheader58 ], [ 0, %.lr.ph ]
  %64 = trunc i64 %57 to i32
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit59
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.1, %.lr.ph.new ], [ %indvars.iv53.unr.ph, %.lr.ph.new.preheader ]
  %66 = add nuw nsw i64 %indvars.iv53, %indvars.iv64
  %67 = trunc i64 %66 to i32
  %68 = srem i32 %67, %0
  %69 = sitofp i32 %68 to double
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv64, i64 %indvars.iv53
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %71 = add nuw nsw i64 %indvars.iv.next54, %indvars.iv64
  %72 = trunc i64 %71 to i32
  %73 = srem i32 %72, %0
  %74 = sitofp i32 %73 to double
  %75 = insertelement <2 x double> undef, double %69, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fdiv <2 x double> %76, %11
  %78 = bitcast double* %70 to <2 x double>*
  store <2 x double> %77, <2 x double>* %78, align 8
  %indvars.iv.next54.1 = add nuw nsw i64 %indvars.iv53, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next54.1, %indvars.iv64
  br i1 %exitcond57.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit59, %.preheader
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv64, i64 %indvars.iv64
  store double 1.000000e+00, double* %79, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %._crit_edge35.loopexit72, label %.preheader

._crit_edge35.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge35

._crit_edge35.loopexit72:                         ; preds = %._crit_edge
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit72, %._crit_edge35.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader27.us.preheader, label %._crit_edge31

.preheader27.us.preheader:                        ; preds = %5
  %8 = add i32 %1, -1
  %9 = add i32 %0, 1
  %10 = add i32 %0, -2
  %11 = sext i32 %0 to i64
  %wide.trip.count52 = zext i32 %1 to i64
  %wide.trip.count46.1 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp ult i32 %8, 3
  %13 = insertelement <2 x double> undef, double %2, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = add nsw i32 %xtraiter, -1
  %16 = zext i32 %15 to i64
  %17 = add nuw nsw i64 %16, 1
  %18 = add nsw i64 %wide.trip.count52, -4
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %..loopexit_crit_edge.us..preheader27.us_crit_edge, %.preheader27.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next54, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv42 = phi i64 [ 1, %.preheader27.us.preheader ], [ %indvars.iv.next43, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %19 = icmp slt i64 %indvars.iv.next54, %11
  br i1 %19, label %.preheader.us.us.preheader, label %.preheader.us32.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader27.us
  %20 = sub nsw i64 0, %indvars.iv53
  %21 = trunc i64 %20 to i32
  %22 = add i32 %9, %21
  %xtraiter47 = and i32 %22, 1
  %lcmp.mod48 = icmp eq i32 %xtraiter47, 0
  %23 = sub i32 0, %21
  %24 = icmp eq i32 %10, %23
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv42, i64 %indvars.iv53
  %indvars.iv.next45.prol = add nuw nsw i64 %indvars.iv42, 1
  br label %.preheader.us.us

.preheader.us32.preheader:                        ; preds = %.preheader27.us
  br i1 %lcmp.mod, label %.preheader.us32.prol.loopexit, label %.preheader.us32.prol.preheader

.preheader.us32.prol.preheader:                   ; preds = %.preheader.us32.preheader
  br label %.preheader.us32.prol

.preheader.us32.prol:                             ; preds = %.preheader.us32.prol.preheader, %.preheader.us32.prol..preheader.us32.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ 0, %.preheader.us32.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ %xtraiter, %.preheader.us32.prol.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.prol
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %2
  store double %28, double* %26, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us32.prol.loopexit.loopexit, label %.preheader.us32.prol..preheader.us32.prol_crit_edge, !llvm.loop !1

.preheader.us32.prol..preheader.us32.prol_crit_edge: ; preds = %.preheader.us32.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.preheader.us32.prol

.preheader.us32.prol.loopexit.loopexit:           ; preds = %.preheader.us32.prol
  br label %.preheader.us32.prol.loopexit

.preheader.us32.prol.loopexit:                    ; preds = %.preheader.us32.prol.loopexit.loopexit, %.preheader.us32.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us32.preheader ], [ %17, %.preheader.us32.prol.loopexit.loopexit ]
  br i1 %12, label %..loopexit_crit_edge.us, label %.preheader.us32.preheader63

.preheader.us32.preheader63:                      ; preds = %.preheader.us32.prol.loopexit
  %29 = sub nsw i64 %18, %indvars.iv.unr
  %30 = lshr i64 %29, 2
  %31 = and i64 %30, 1
  %lcmp.mod68 = icmp eq i64 %31, 0
  br i1 %lcmp.mod68, label %.preheader.us32.prol.preheader65, label %.preheader.us32.prol.loopexit66.unr-lcssa

.preheader.us32.prol.preheader65:                 ; preds = %.preheader.us32.preheader63
  br label %.preheader.us32.prol69

.preheader.us32.prol69:                           ; preds = %.preheader.us32.prol.preheader65
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.unr
  %33 = bitcast double* %32 to <2 x double>*
  %34 = load <2 x double>, <2 x double>* %33, align 8
  %35 = fmul <2 x double> %34, %14
  store <2 x double> %35, <2 x double>* %33, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.1.prol
  %37 = bitcast double* %36 to <2 x double>*
  %38 = load <2 x double>, <2 x double>* %37, align 8
  %39 = fmul <2 x double> %38, %14
  store <2 x double> %39, <2 x double>* %37, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %.preheader.us32.prol.loopexit66.unr-lcssa

.preheader.us32.prol.loopexit66.unr-lcssa:        ; preds = %.preheader.us32.preheader63, %.preheader.us32.prol69
  %indvars.iv.unr71.ph = phi i64 [ %indvars.iv.next.3.prol, %.preheader.us32.prol69 ], [ %indvars.iv.unr, %.preheader.us32.preheader63 ]
  br label %.preheader.us32.prol.loopexit66

.preheader.us32.prol.loopexit66:                  ; preds = %.preheader.us32.prol.loopexit66.unr-lcssa
  %40 = icmp eq i64 %30, 0
  br i1 %40, label %..loopexit_crit_edge.us.loopexit64, label %.preheader.us32.preheader63.new

.preheader.us32.preheader63.new:                  ; preds = %.preheader.us32.prol.loopexit66
  br label %.preheader.us32

.preheader.us32:                                  ; preds = %.preheader.us32, %.preheader.us32.preheader63.new
  %indvars.iv = phi i64 [ %indvars.iv.unr71.ph, %.preheader.us32.preheader63.new ], [ %indvars.iv.next.3.1, %.preheader.us32 ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv
  %42 = bitcast double* %41 to <2 x double>*
  %43 = load <2 x double>, <2 x double>* %42, align 8
  %44 = fmul <2 x double> %43, %14
  store <2 x double> %44, <2 x double>* %42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %46 = bitcast double* %45 to <2 x double>*
  %47 = load <2 x double>, <2 x double>* %46, align 8
  %48 = fmul <2 x double> %47, %14
  store <2 x double> %48, <2 x double>* %46, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.3
  %50 = bitcast double* %49 to <2 x double>*
  %51 = load <2 x double>, <2 x double>* %50, align 8
  %52 = fmul <2 x double> %51, %14
  store <2 x double> %52, <2 x double>* %50, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.1.1
  %54 = bitcast double* %53 to <2 x double>*
  %55 = load <2 x double>, <2 x double>* %54, align 8
  %56 = fmul <2 x double> %55, %14
  store <2 x double> %56, <2 x double>* %54, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count52
  br i1 %exitcond.3.1, label %..loopexit_crit_edge.us.loopexit64.unr-lcssa, label %.preheader.us32

..loopexit_crit_edge.us.loopexit:                 ; preds = %._crit_edge.us.us
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us.loopexit64.unr-lcssa:     ; preds = %.preheader.us32
  br label %..loopexit_crit_edge.us.loopexit64

..loopexit_crit_edge.us.loopexit64:               ; preds = %.preheader.us32.prol.loopexit66, %..loopexit_crit_edge.us.loopexit64.unr-lcssa
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit64, %..loopexit_crit_edge.us.loopexit, %.preheader.us32.prol.loopexit
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count46.1
  br i1 %exitcond56, label %._crit_edge31.loopexit, label %..loopexit_crit_edge.us..preheader27.us_crit_edge

..loopexit_crit_edge.us..preheader27.us_crit_edge: ; preds = %..loopexit_crit_edge.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br label %.preheader27.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv50 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next51, %._crit_edge.us.us ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv50
  br i1 %lcmp.mod48, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %58 = load double, double* %25, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv50
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = load double, double* %57, align 8
  %63 = fadd double %62, %61
  store double %63, double* %57, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us, %.prol.preheader
  %indvars.iv44.unr.ph = phi i64 [ %indvars.iv.next45.prol, %.prol.preheader ], [ %indvars.iv42, %.preheader.us.us ]
  %.pre62 = load double, double* %57, align 8
  br i1 %24, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %64 = phi double [ %.pre62, %.prol.loopexit ], [ %78, %._crit_edge.us.us.loopexit ]
  %65 = fmul double %64, %2
  store double %65, double* %57, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond, label %..loopexit_crit_edge.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %66 = phi double [ %78, %.preheader.us.us.new ], [ %.pre62, %.preheader.us.us.new.preheader ]
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.1, %.preheader.us.us.new ], [ %indvars.iv44.unr.ph, %.preheader.us.us.new.preheader ]
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv53
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv50
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %57, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next45, i64 %indvars.iv53
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next45, i64 %indvars.iv50
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fadd double %72, %77
  store double %78, double* %57, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next45.1, %wide.trip.count46.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge31.loopexit:                           ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
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
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
