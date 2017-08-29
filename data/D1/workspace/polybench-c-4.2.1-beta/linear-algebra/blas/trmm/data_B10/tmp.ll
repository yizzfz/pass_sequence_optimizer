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
  %.cast = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %.cast)
  tail call void (...) @polybench_timer_start() #4
  %7 = load double, double* %3, align 8
  tail call fastcc void @kernel_trmm(i32 1000, i32 1200, double %7, [1000 x double]* %6, [1200 x double]* %.cast)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %8 = icmp sgt i32 %0, 42
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %2
  %10 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %10, align 1
  %11 = icmp eq i8 %strcmpload, 0
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %9
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %.cast)
  br label %13

; <label>:13:                                     ; preds = %9, %12, %2
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge28

.preheader.lr.ph:                                 ; preds = %5
  %7 = sitofp i32 %0 to double
  %8 = icmp sgt i32 %1, 0
  %9 = sitofp i32 %1 to double
  br i1 %8, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count59 = zext i32 %0 to i64
  %10 = insertelement <2 x double> undef, double %7, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter37 = and i32 %1, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  %12 = icmp eq i32 %1, 1
  %wide.trip.count45 = zext i32 %0 to i64
  %wide.trip.count34.1 = zext i32 %1 to i64
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge24.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge24.us ], [ 0, %.preheader.us.preheader ]
  %17 = add nuw i64 %indvars.iv43, 4294967295
  %18 = icmp sgt i64 %indvars.iv43, 0
  br i1 %18, label %.lr.ph.us, label %._crit_edge.us

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter62 = and i64 %indvars.iv43, 1
  %lcmp.mod = icmp eq i64 %xtraiter62, 0
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %19 = trunc i64 %indvars.iv43 to i32
  %20 = srem i32 %19, %0
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %7
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 0
  store double %22, double* %23, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %24 = trunc i64 %17 to i32
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit.unr-lcssa
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %26 = add nuw nsw i64 %indvars.iv, %indvars.iv43
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %0
  %29 = sitofp i32 %28 to double
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = add nuw nsw i64 %indvars.iv.next, %indvars.iv43
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, %0
  %34 = sitofp i32 %33 to double
  %35 = insertelement <2 x double> undef, double %29, i32 0
  %36 = insertelement <2 x double> %35, double %34, i32 1
  %37 = fdiv <2 x double> %36, %14
  %38 = bitcast double* %30 to <2 x double>*
  store <2 x double> %37, <2 x double>* %38, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv43
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit.unr-lcssa, %.preheader.us
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv43
  store double 1.000000e+00, double* %39, align 8
  %40 = trunc i64 %indvars.iv43 to i32
  %41 = add i32 %40, %1
  br i1 %lcmp.mod38, label %.prol.loopexit36.unr-lcssa, label %.prol.preheader35

.prol.preheader35:                                ; preds = %._crit_edge.us
  %42 = srem i32 %41, %1
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %9
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 0
  store double %44, double* %45, align 8
  br label %.prol.loopexit36.unr-lcssa

.prol.loopexit36.unr-lcssa:                       ; preds = %._crit_edge.us, %.prol.preheader35
  %indvars.iv32.unr.ph = phi i64 [ 1, %.prol.preheader35 ], [ 0, %._crit_edge.us ]
  br i1 %12, label %._crit_edge24.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit36.unr-lcssa
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv32 = phi i64 [ %indvars.iv.next33.1, %._crit_edge.us.new ], [ %indvars.iv32.unr.ph, %._crit_edge.us.new.preheader ]
  %46 = trunc i64 %indvars.iv32 to i32
  %47 = sub i32 %41, %46
  %48 = srem i32 %47, %1
  %49 = sitofp i32 %48 to double
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv32
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %51 = trunc i64 %indvars.iv.next33 to i32
  %52 = sub i32 %41, %51
  %53 = srem i32 %52, %1
  %54 = sitofp i32 %53 to double
  %55 = insertelement <2 x double> undef, double %49, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fdiv <2 x double> %56, %16
  %58 = bitcast double* %50 to <2 x double>*
  store <2 x double> %57, <2 x double>* %58, align 8
  %indvars.iv.next33.1 = add nuw nsw i64 %indvars.iv32, 2
  %exitcond.140 = icmp eq i64 %indvars.iv.next33.1, %wide.trip.count34.1
  br i1 %exitcond.140, label %._crit_edge24.us.loopexit, label %._crit_edge.us.new

._crit_edge24.us.loopexit:                        ; preds = %._crit_edge.us.new
  br label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %._crit_edge24.us.loopexit, %.prol.loopexit36.unr-lcssa
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond, label %._crit_edge28.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge ], [ 0, %.preheader.preheader ]
  %59 = add nuw i64 %indvars.iv57, 4294967295
  %60 = icmp sgt i64 %indvars.iv57, 0
  br i1 %60, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter5361 = and i64 %indvars.iv57, 1
  %lcmp.mod54 = icmp eq i64 %xtraiter5361, 0
  br i1 %lcmp.mod54, label %.prol.loopexit52.unr-lcssa, label %.prol.preheader51

.prol.preheader51:                                ; preds = %.lr.ph
  %61 = trunc i64 %indvars.iv57 to i32
  %62 = srem i32 %61, %0
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, %7
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv57, i64 0
  store double %64, double* %65, align 8
  br label %.prol.loopexit52.unr-lcssa

.prol.loopexit52.unr-lcssa:                       ; preds = %.lr.ph, %.prol.preheader51
  %indvars.iv46.unr.ph = phi i64 [ 1, %.prol.preheader51 ], [ 0, %.lr.ph ]
  %66 = trunc i64 %59 to i32
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit52.unr-lcssa
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %.lr.ph.new ], [ %indvars.iv46.unr.ph, %.lr.ph.new.preheader ]
  %68 = add nuw nsw i64 %indvars.iv46, %indvars.iv57
  %69 = trunc i64 %68 to i32
  %70 = srem i32 %69, %0
  %71 = sitofp i32 %70 to double
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv57, i64 %indvars.iv46
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %73 = add nuw nsw i64 %indvars.iv.next47, %indvars.iv57
  %74 = trunc i64 %73 to i32
  %75 = srem i32 %74, %0
  %76 = sitofp i32 %75 to double
  %77 = insertelement <2 x double> undef, double %71, i32 0
  %78 = insertelement <2 x double> %77, double %76, i32 1
  %79 = fdiv <2 x double> %78, %11
  %80 = bitcast double* %72 to <2 x double>*
  store <2 x double> %79, <2 x double>* %80, align 8
  %indvars.iv.next47.1 = add nuw nsw i64 %indvars.iv46, 2
  %exitcond50.1 = icmp eq i64 %indvars.iv.next47.1, %indvars.iv57
  br i1 %exitcond50.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit52.unr-lcssa, %.preheader
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv57, i64 %indvars.iv57
  store double 1.000000e+00, double* %81, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge28.loopexit65, label %.preheader

._crit_edge28.loopexit:                           ; preds = %._crit_edge24.us
  br label %._crit_edge28

._crit_edge28.loopexit65:                         ; preds = %._crit_edge
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit65, %._crit_edge28.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader22.us.preheader, label %._crit_edge30

.preheader22.us.preheader:                        ; preds = %5
  %8 = add i32 %1, -1
  %9 = add i32 %0, 1
  %10 = add i32 %0, -2
  %11 = sext i32 %0 to i64
  %wide.trip.count52 = zext i32 %1 to i64
  %wide.trip.count46.1 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp ult i32 %8, 3
  %13 = add nsw i32 %xtraiter, -1
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  %16 = add nsw i64 %wide.trip.count52, -4
  %17 = insertelement <2 x double> undef, double %2, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = insertelement <2 x double> undef, double %2, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x double> undef, double %2, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader22.us

.preheader22.us:                                  ; preds = %._crit_edge27.us, %.preheader22.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader22.us.preheader ], [ %indvars.iv.next54, %._crit_edge27.us ]
  %indvars.iv42 = phi i64 [ 1, %.preheader22.us.preheader ], [ %indvars.iv.next43, %._crit_edge27.us ]
  %23 = sub nsw i64 0, %indvars.iv53
  %24 = trunc i64 %23 to i32
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %25 = icmp slt i64 %indvars.iv.next54, %11
  br i1 %25, label %.preheader.us.us.preheader, label %.preheader.us31.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader22.us
  %26 = add i32 %9, %24
  %xtraiter47 = and i32 %26, 1
  %lcmp.mod48 = icmp eq i32 %xtraiter47, 0
  %27 = sub i32 0, %24
  %28 = icmp eq i32 %10, %27
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv42, i64 %indvars.iv53
  %indvars.iv.next45.prol = add nuw nsw i64 %indvars.iv42, 1
  br label %.preheader.us.us

.preheader.us31.preheader:                        ; preds = %.preheader22.us
  br i1 %lcmp.mod, label %.preheader.us31.prol.loopexit, label %.preheader.us31.prol.preheader

.preheader.us31.prol.preheader:                   ; preds = %.preheader.us31.preheader
  br label %.preheader.us31.prol

.preheader.us31.prol:                             ; preds = %.preheader.us31.prol.preheader, %.preheader.us31.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us31.prol ], [ 0, %.preheader.us31.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader.us31.prol ], [ %xtraiter, %.preheader.us31.prol.preheader ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.prol
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %2
  store double %32, double* %30, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us31.prol.loopexit.loopexit, label %.preheader.us31.prol, !llvm.loop !1

.preheader.us31.prol.loopexit.loopexit:           ; preds = %.preheader.us31.prol
  br label %.preheader.us31.prol.loopexit

.preheader.us31.prol.loopexit:                    ; preds = %.preheader.us31.prol.loopexit.loopexit, %.preheader.us31.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us31.preheader ], [ %15, %.preheader.us31.prol.loopexit.loopexit ]
  br i1 %12, label %._crit_edge27.us, label %.preheader.us31.preheader64

.preheader.us31.preheader64:                      ; preds = %.preheader.us31.prol.loopexit
  %33 = sub nsw i64 %16, %indvars.iv.unr
  %34 = lshr i64 %33, 2
  %35 = and i64 %34, 1
  %lcmp.mod69 = icmp eq i64 %35, 0
  br i1 %lcmp.mod69, label %.preheader.us31.prol.preheader66, label %.preheader.us31.prol.loopexit67.unr-lcssa

.preheader.us31.prol.preheader66:                 ; preds = %.preheader.us31.preheader64
  br label %.preheader.us31.prol70

.preheader.us31.prol70:                           ; preds = %.preheader.us31.prol.preheader66
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.unr
  %37 = bitcast double* %36 to <2 x double>*
  %38 = load <2 x double>, <2 x double>* %37, align 8
  %39 = fmul <2 x double> %38, %18
  store <2 x double> %39, <2 x double>* %37, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.1.prol
  %41 = bitcast double* %40 to <2 x double>*
  %42 = load <2 x double>, <2 x double>* %41, align 8
  %43 = fmul <2 x double> %42, %18
  store <2 x double> %43, <2 x double>* %41, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %.preheader.us31.prol.loopexit67.unr-lcssa

.preheader.us31.prol.loopexit67.unr-lcssa:        ; preds = %.preheader.us31.preheader64, %.preheader.us31.prol70
  %indvars.iv.unr72.ph = phi i64 [ %indvars.iv.next.3.prol, %.preheader.us31.prol70 ], [ %indvars.iv.unr, %.preheader.us31.preheader64 ]
  br label %.preheader.us31.prol.loopexit67

.preheader.us31.prol.loopexit67:                  ; preds = %.preheader.us31.prol.loopexit67.unr-lcssa
  %44 = icmp eq i64 %34, 0
  br i1 %44, label %._crit_edge27.us.loopexit65, label %.preheader.us31.preheader64.new

.preheader.us31.preheader64.new:                  ; preds = %.preheader.us31.prol.loopexit67
  br label %.preheader.us31

.preheader.us31:                                  ; preds = %.preheader.us31, %.preheader.us31.preheader64.new
  %indvars.iv = phi i64 [ %indvars.iv.unr72.ph, %.preheader.us31.preheader64.new ], [ %indvars.iv.next.3.1, %.preheader.us31 ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv
  %46 = bitcast double* %45 to <2 x double>*
  %47 = load <2 x double>, <2 x double>* %46, align 8
  %48 = fmul <2 x double> %47, %20
  store <2 x double> %48, <2 x double>* %46, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %50 = bitcast double* %49 to <2 x double>*
  %51 = load <2 x double>, <2 x double>* %50, align 8
  %52 = fmul <2 x double> %51, %20
  store <2 x double> %52, <2 x double>* %50, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.3
  %54 = bitcast double* %53 to <2 x double>*
  %55 = load <2 x double>, <2 x double>* %54, align 8
  %56 = fmul <2 x double> %55, %22
  store <2 x double> %56, <2 x double>* %54, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.1.1
  %58 = bitcast double* %57 to <2 x double>*
  %59 = load <2 x double>, <2 x double>* %58, align 8
  %60 = fmul <2 x double> %59, %22
  store <2 x double> %60, <2 x double>* %58, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count52
  br i1 %exitcond.3.1, label %._crit_edge27.us.loopexit65.unr-lcssa, label %.preheader.us31

._crit_edge27.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge27.us

._crit_edge27.us.loopexit65.unr-lcssa:            ; preds = %.preheader.us31
  br label %._crit_edge27.us.loopexit65

._crit_edge27.us.loopexit65:                      ; preds = %.preheader.us31.prol.loopexit67, %._crit_edge27.us.loopexit65.unr-lcssa
  br label %._crit_edge27.us

._crit_edge27.us:                                 ; preds = %._crit_edge27.us.loopexit65, %._crit_edge27.us.loopexit, %.preheader.us31.prol.loopexit
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count46.1
  br i1 %exitcond56, label %._crit_edge30.loopexit, label %.preheader22.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv50
  br i1 %lcmp.mod48, label %.preheader.us.us..prol.loopexit.unr-lcssa_crit_edge, label %.prol.preheader

.preheader.us.us..prol.loopexit.unr-lcssa_crit_edge: ; preds = %.preheader.us.us
  %.pre58.pre = load double, double* %61, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.preheader.us.us
  %62 = load double, double* %29, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv50
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = load double, double* %61, align 8
  %67 = fadd double %66, %65
  store double %67, double* %61, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader.us.us..prol.loopexit.unr-lcssa_crit_edge, %.prol.preheader
  %.pre58 = phi double [ %67, %.prol.preheader ], [ %.pre58.pre, %.preheader.us.us..prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv44.unr.ph = phi i64 [ %indvars.iv.next45.prol, %.prol.preheader ], [ %indvars.iv42, %.preheader.us.us..prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %28, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit.unr-lcssa
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit.unr-lcssa
  %68 = phi double [ %.pre58, %.prol.loopexit.unr-lcssa ], [ %82, %._crit_edge.us.us.loopexit ]
  %69 = fmul double %68, %2
  store double %69, double* %61, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond, label %._crit_edge27.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %70 = phi double [ %82, %.preheader.us.us.new ], [ %.pre58, %.preheader.us.us.new.preheader ]
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.1, %.preheader.us.us.new ], [ %indvars.iv44.unr.ph, %.preheader.us.us.new.preheader ]
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv53
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv50
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fadd double %70, %75
  store double %76, double* %61, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next45, i64 %indvars.iv53
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next45, i64 %indvars.iv50
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %76, %81
  store double %82, double* %61, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next45.1, %wide.trip.count46.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge30.loopexit:                           ; preds = %._crit_edge27.us
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %5
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
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count15 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv13, %10
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %19 ], [ 0, %.preheader.us ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
