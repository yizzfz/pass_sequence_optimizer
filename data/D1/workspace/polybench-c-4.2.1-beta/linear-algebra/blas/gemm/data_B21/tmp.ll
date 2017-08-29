; ModuleID = 'A.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %._crit_edge.preheader.lr.ph, label %._crit_edge8.preheader

._crit_edge.preheader.lr.ph:                      ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  br i1 %10, label %._crit_edge.preheader.us.preheader, label %._crit_edge7.preheader.lr.ph

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %12 = sext i32 %0 to i64
  %13 = zext i32 %1 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv57 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next58, %._crit_edge._crit_edge.us ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv53 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next54, %._crit_edge.us ]
  %14 = mul nsw i64 %indvars.iv57, %indvars.iv53
  %15 = add nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %11
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv57, i64 %indvars.iv53
  store double %19, double* %20, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next54, %13
  br i1 %exitcond65, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next58 = add nsw i64 %indvars.iv57, 1
  %21 = icmp slt i64 %indvars.iv.next58, %12
  br i1 %21, label %._crit_edge.preheader.us, label %._crit_edge7.preheader.lr.ph.loopexit

._crit_edge7.preheader.lr.ph.loopexit:            ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge7.preheader.lr.ph

._crit_edge7.preheader.lr.ph:                     ; preds = %._crit_edge7.preheader.lr.ph.loopexit, %._crit_edge.preheader.lr.ph
  %22 = icmp sgt i32 %2, 0
  br i1 %22, label %._crit_edge7.preheader.us.preheader, label %._crit_edge8.preheader

._crit_edge7.preheader.us.preheader:              ; preds = %._crit_edge7.preheader.lr.ph
  %23 = sext i32 %0 to i64
  %24 = zext i32 %2 to i64
  %25 = sitofp i32 %2 to double
  %xtraiter = and i64 %24, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %26 = icmp eq i32 %2, 1
  br label %._crit_edge7.preheader.us

._crit_edge7.preheader.us:                        ; preds = %._crit_edge7._crit_edge.us, %._crit_edge7.preheader.us.preheader
  %indvars.iv49 = phi i64 [ 0, %._crit_edge7.preheader.us.preheader ], [ %indvars.iv.next50, %._crit_edge7._crit_edge.us ]
  br i1 %lcmp.mod, label %._crit_edge7.us.prol.loopexit.unr-lcssa, label %._crit_edge7.us.prol.preheader

._crit_edge7.us.prol.preheader:                   ; preds = %._crit_edge7.preheader.us
  br label %._crit_edge7.us.prol

._crit_edge7.us.prol:                             ; preds = %._crit_edge7.us.prol.preheader
  %27 = trunc i64 %indvars.iv49 to i32
  %28 = srem i32 %27, %2
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %25
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv49, i64 0
  store double %30, double* %31, align 8
  br label %._crit_edge7.us.prol.loopexit.unr-lcssa

._crit_edge7.us.prol.loopexit.unr-lcssa:          ; preds = %._crit_edge7.preheader.us, %._crit_edge7.us.prol
  %indvars.iv45.unr.ph = phi i64 [ 1, %._crit_edge7.us.prol ], [ 0, %._crit_edge7.preheader.us ]
  br label %._crit_edge7.us.prol.loopexit

._crit_edge7.us.prol.loopexit:                    ; preds = %._crit_edge7.us.prol.loopexit.unr-lcssa
  br i1 %26, label %._crit_edge7._crit_edge.us, label %._crit_edge7.preheader.us.new

._crit_edge7.preheader.us.new:                    ; preds = %._crit_edge7.us.prol.loopexit
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us, %._crit_edge7.preheader.us.new
  %indvars.iv45 = phi i64 [ %indvars.iv45.unr.ph, %._crit_edge7.preheader.us.new ], [ %indvars.iv.next46.1, %._crit_edge7.us ]
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %32 = mul nsw i64 %indvars.iv49, %indvars.iv.next46
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %2
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %25
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv49, i64 %indvars.iv45
  store double %36, double* %37, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %38 = mul nsw i64 %indvars.iv49, %indvars.iv.next46.1
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %2
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %25
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv49, i64 %indvars.iv.next46
  store double %42, double* %43, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next46.1, %24
  br i1 %exitcond.1, label %._crit_edge7._crit_edge.us.unr-lcssa, label %._crit_edge7.us

._crit_edge7._crit_edge.us.unr-lcssa:             ; preds = %._crit_edge7.us
  br label %._crit_edge7._crit_edge.us

._crit_edge7._crit_edge.us:                       ; preds = %._crit_edge7.us.prol.loopexit, %._crit_edge7._crit_edge.us.unr-lcssa
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  %44 = icmp slt i64 %indvars.iv.next50, %23
  br i1 %44, label %._crit_edge7.preheader.us, label %._crit_edge8.preheader.loopexit

._crit_edge8.preheader.loopexit:                  ; preds = %._crit_edge7._crit_edge.us
  br label %._crit_edge8.preheader

._crit_edge8.preheader:                           ; preds = %._crit_edge8.preheader.loopexit, %._crit_edge7.preheader.lr.ph, %8
  %45 = icmp sgt i32 %2, 0
  %46 = icmp sgt i32 %1, 0
  %or.cond = and i1 %45, %46
  br i1 %or.cond, label %._crit_edge9.preheader.us.preheader, label %._crit_edge8.preheader._crit_edge

._crit_edge9.preheader.us.preheader:              ; preds = %._crit_edge8.preheader
  %47 = sext i32 %2 to i64
  %48 = zext i32 %1 to i64
  %49 = sitofp i32 %1 to double
  br label %._crit_edge9.preheader.us

._crit_edge9.preheader.us:                        ; preds = %._crit_edge9._crit_edge.us, %._crit_edge9.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %._crit_edge9.preheader.us.preheader ], [ %indvars.iv.next44, %._crit_edge9._crit_edge.us ]
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us, %._crit_edge9.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge9.preheader.us ], [ %indvars.iv.next, %._crit_edge9.us ]
  %50 = add nuw nsw i64 %indvars.iv, 2
  %51 = mul nsw i64 %indvars.iv43, %50
  %52 = trunc i64 %51 to i32
  %53 = srem i32 %52, %1
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %54, %49
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv43, i64 %indvars.iv
  store double %55, double* %56, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next, %48
  br i1 %exitcond62, label %._crit_edge9._crit_edge.us, label %._crit_edge9.us

._crit_edge9._crit_edge.us:                       ; preds = %._crit_edge9.us
  %indvars.iv.next44 = add nsw i64 %indvars.iv43, 1
  %57 = icmp slt i64 %indvars.iv.next44, %47
  br i1 %57, label %._crit_edge9.preheader.us, label %._crit_edge8.preheader._crit_edge.loopexit

._crit_edge8.preheader._crit_edge.loopexit:       ; preds = %._crit_edge9._crit_edge.us
  br label %._crit_edge8.preheader._crit_edge

._crit_edge8.preheader._crit_edge:                ; preds = %._crit_edge8.preheader._crit_edge.loopexit, %._crit_edge8.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %._crit_edge.preheader.lr.ph, label %._crit_edge

._crit_edge.preheader.lr.ph:                      ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  br i1 %10, label %._crit_edge.preheader.us.preheader, label %._crit_edge.preheader.preheader

._crit_edge.preheader.preheader:                  ; preds = %._crit_edge.preheader.lr.ph
  %12 = sext i32 %0 to i64
  %13 = add nsw i64 %12, -1
  %xtraiter70 = and i64 %12, 7
  %lcmp.mod71 = icmp eq i64 %xtraiter70, 0
  br i1 %lcmp.mod71, label %._crit_edge.preheader.prol.loopexit, label %._crit_edge.preheader.prol.preheader

._crit_edge.preheader.prol.preheader:             ; preds = %._crit_edge.preheader.preheader
  br label %._crit_edge.preheader.prol

._crit_edge.preheader.prol:                       ; preds = %._crit_edge.preheader.prol, %._crit_edge.preheader.prol.preheader
  %indvars.iv52.prol = phi i64 [ 0, %._crit_edge.preheader.prol.preheader ], [ %indvars.iv.next53.prol, %._crit_edge.preheader.prol ]
  %prol.iter72 = phi i64 [ %xtraiter70, %._crit_edge.preheader.prol.preheader ], [ %prol.iter72.sub, %._crit_edge.preheader.prol ]
  %indvars.iv.next53.prol = add nsw i64 %indvars.iv52.prol, 1
  %prol.iter72.sub = add i64 %prol.iter72, -1
  %prol.iter72.cmp = icmp eq i64 %prol.iter72.sub, 0
  br i1 %prol.iter72.cmp, label %._crit_edge.preheader.prol.loopexit.unr-lcssa, label %._crit_edge.preheader.prol, !llvm.loop !1

._crit_edge.preheader.prol.loopexit.unr-lcssa:    ; preds = %._crit_edge.preheader.prol
  br label %._crit_edge.preheader.prol.loopexit

._crit_edge.preheader.prol.loopexit:              ; preds = %._crit_edge.preheader.preheader, %._crit_edge.preheader.prol.loopexit.unr-lcssa
  %indvars.iv52.unr = phi i64 [ 0, %._crit_edge.preheader.preheader ], [ %indvars.iv.next53.prol, %._crit_edge.preheader.prol.loopexit.unr-lcssa ]
  %14 = icmp ult i64 %13, 7
  br i1 %14, label %._crit_edge.loopexit61, label %._crit_edge.preheader.preheader.new

._crit_edge.preheader.preheader.new:              ; preds = %._crit_edge.preheader.prol.loopexit
  br label %._crit_edge.preheader

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %15 = add i32 %1, -1
  %16 = sext i32 %1 to i64
  %17 = sext i32 %0 to i64
  %18 = and i32 %1, 3
  %19 = add nsw i32 %18, -1
  %20 = zext i32 %19 to i64
  %21 = add nuw nsw i64 %20, 1
  %22 = zext i32 %2 to i64
  %lcmp.mod = icmp eq i32 %18, 0
  %23 = icmp ult i32 %15, 3
  %24 = insertelement <2 x double> undef, double %4, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %wide.trip.count.3 = zext i32 %1 to i64
  %26 = add nsw i64 %wide.trip.count.3, -4
  %xtraiter68 = and i64 %16, 1
  %lcmp.mod69 = icmp eq i64 %xtraiter68, 0
  %27 = icmp eq i32 %1, 1
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge4._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next44, %._crit_edge4._crit_edge.us ]
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %._crit_edge.preheader.us
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge ], [ %18, %._crit_edge.us.prol.preheader ]
  %28 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv.prol
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %4
  store double %30, double* %28, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.loopexit, label %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge, !llvm.loop !3

._crit_edge.us.prol.._crit_edge.us.prol_crit_edge: ; preds = %._crit_edge.us.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %._crit_edge.us.prol

._crit_edge.us.prol.loopexit.loopexit:            ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %._crit_edge.us.prol.loopexit.loopexit, %._crit_edge.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %._crit_edge.preheader.us ], [ %21, %._crit_edge.us.prol.loopexit.loopexit ]
  br i1 %23, label %._crit_edge.._crit_edge4.preheader_crit_edge.us, label %._crit_edge.us.preheader

._crit_edge.us.preheader:                         ; preds = %._crit_edge.us.prol.loopexit
  %31 = sub nsw i64 %26, %indvars.iv.unr
  %32 = lshr i64 %31, 2
  %33 = and i64 %32, 1
  %lcmp.mod64 = icmp eq i64 %33, 0
  br i1 %lcmp.mod64, label %._crit_edge.us.prol.preheader62, label %._crit_edge.us.prol.loopexit63.unr-lcssa

._crit_edge.us.prol.preheader62:                  ; preds = %._crit_edge.us.preheader
  br label %._crit_edge.us.prol65

._crit_edge.us.prol65:                            ; preds = %._crit_edge.us.prol.preheader62
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv.unr
  %35 = bitcast double* %34 to <2 x double>*
  %36 = load <2 x double>, <2 x double>* %35, align 8
  %37 = fmul <2 x double> %25, %36
  store <2 x double> %37, <2 x double>* %35, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv.next.1.prol
  %39 = bitcast double* %38 to <2 x double>*
  %40 = load <2 x double>, <2 x double>* %39, align 8
  %41 = fmul <2 x double> %25, %40
  store <2 x double> %41, <2 x double>* %39, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %._crit_edge.us.prol.loopexit63.unr-lcssa

._crit_edge.us.prol.loopexit63.unr-lcssa:         ; preds = %._crit_edge.us.preheader, %._crit_edge.us.prol65
  %indvars.iv.unr67.ph = phi i64 [ %indvars.iv.next.3.prol, %._crit_edge.us.prol65 ], [ %indvars.iv.unr, %._crit_edge.us.preheader ]
  br label %._crit_edge.us.prol.loopexit63

._crit_edge.us.prol.loopexit63:                   ; preds = %._crit_edge.us.prol.loopexit63.unr-lcssa
  %42 = icmp eq i64 %32, 0
  br i1 %42, label %._crit_edge.._crit_edge4.preheader_crit_edge.us.loopexit, label %._crit_edge.us.preheader.new

._crit_edge.us.preheader.new:                     ; preds = %._crit_edge.us.prol.loopexit63
  br label %._crit_edge.us

._crit_edge4._crit_edge.us.loopexit:              ; preds = %._crit_edge5._crit_edge.us.us
  br label %._crit_edge4._crit_edge.us

._crit_edge4._crit_edge.us:                       ; preds = %._crit_edge4._crit_edge.us.loopexit, %._crit_edge.._crit_edge4.preheader_crit_edge.us
  %indvars.iv.next44 = add nsw i64 %indvars.iv43, 1
  %43 = icmp slt i64 %indvars.iv.next44, %17
  br i1 %43, label %._crit_edge.preheader.us, label %._crit_edge.loopexit

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr67.ph, %._crit_edge.us.preheader.new ], [ %indvars.iv.next.3.1, %._crit_edge.us ]
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv
  %45 = bitcast double* %44 to <2 x double>*
  %46 = load <2 x double>, <2 x double>* %45, align 8
  %47 = fmul <2 x double> %25, %46
  store <2 x double> %47, <2 x double>* %45, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %48 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %49 = bitcast double* %48 to <2 x double>*
  %50 = load <2 x double>, <2 x double>* %49, align 8
  %51 = fmul <2 x double> %25, %50
  store <2 x double> %51, <2 x double>* %49, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv.next.3
  %53 = bitcast double* %52 to <2 x double>*
  %54 = load <2 x double>, <2 x double>* %53, align 8
  %55 = fmul <2 x double> %25, %54
  store <2 x double> %55, <2 x double>* %53, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv.next.1.1
  %57 = bitcast double* %56 to <2 x double>*
  %58 = load <2 x double>, <2 x double>* %57, align 8
  %59 = fmul <2 x double> %25, %58
  store <2 x double> %59, <2 x double>* %57, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count.3
  br i1 %exitcond.3.1, label %._crit_edge.._crit_edge4.preheader_crit_edge.us.loopexit.unr-lcssa, label %._crit_edge.us

._crit_edge.._crit_edge4.preheader_crit_edge.us.loopexit.unr-lcssa: ; preds = %._crit_edge.us
  br label %._crit_edge.._crit_edge4.preheader_crit_edge.us.loopexit

._crit_edge.._crit_edge4.preheader_crit_edge.us.loopexit: ; preds = %._crit_edge.us.prol.loopexit63, %._crit_edge.._crit_edge4.preheader_crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.._crit_edge4.preheader_crit_edge.us

._crit_edge.._crit_edge4.preheader_crit_edge.us:  ; preds = %._crit_edge.._crit_edge4.preheader_crit_edge.us.loopexit, %._crit_edge.us.prol.loopexit
  br i1 %11, label %._crit_edge5.preheader.us.us.preheader, label %._crit_edge4._crit_edge.us

._crit_edge5.preheader.us.us.preheader:           ; preds = %._crit_edge.._crit_edge4.preheader_crit_edge.us
  %60 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 0
  br label %._crit_edge5.preheader.us.us

._crit_edge5.preheader.us.us:                     ; preds = %._crit_edge5.preheader.us.us.preheader, %._crit_edge5._crit_edge.us.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge5._crit_edge.us.us ], [ 0, %._crit_edge5.preheader.us.us.preheader ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv43, i64 %indvars.iv40
  br i1 %lcmp.mod69, label %._crit_edge5.us.us.prol.loopexit.unr-lcssa, label %._crit_edge5.us.us.prol.preheader

._crit_edge5.us.us.prol.preheader:                ; preds = %._crit_edge5.preheader.us.us
  br label %._crit_edge5.us.us.prol

._crit_edge5.us.us.prol:                          ; preds = %._crit_edge5.us.us.prol.preheader
  %62 = load double, double* %61, align 8
  %63 = fmul double %62, %3
  %64 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv40, i64 0
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = load double, double* %60, align 8
  %68 = fadd double %66, %67
  store double %68, double* %60, align 8
  br label %._crit_edge5.us.us.prol.loopexit.unr-lcssa

._crit_edge5.us.us.prol.loopexit.unr-lcssa:       ; preds = %._crit_edge5.preheader.us.us, %._crit_edge5.us.us.prol
  %indvars.iv38.unr.ph = phi i64 [ 1, %._crit_edge5.us.us.prol ], [ 0, %._crit_edge5.preheader.us.us ]
  br label %._crit_edge5.us.us.prol.loopexit

._crit_edge5.us.us.prol.loopexit:                 ; preds = %._crit_edge5.us.us.prol.loopexit.unr-lcssa
  br i1 %27, label %._crit_edge5._crit_edge.us.us, label %._crit_edge5.preheader.us.us.new

._crit_edge5.preheader.us.us.new:                 ; preds = %._crit_edge5.us.us.prol.loopexit
  br label %._crit_edge5.us.us

._crit_edge5._crit_edge.us.us.unr-lcssa:          ; preds = %._crit_edge5.us.us
  br label %._crit_edge5._crit_edge.us.us

._crit_edge5._crit_edge.us.us:                    ; preds = %._crit_edge5.us.us.prol.loopexit, %._crit_edge5._crit_edge.us.us.unr-lcssa
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next41, %22
  br i1 %exitcond55, label %._crit_edge4._crit_edge.us.loopexit, label %._crit_edge5.preheader.us.us

._crit_edge5.us.us:                               ; preds = %._crit_edge5.us.us, %._crit_edge5.preheader.us.us.new
  %indvars.iv38 = phi i64 [ %indvars.iv38.unr.ph, %._crit_edge5.preheader.us.us.new ], [ %indvars.iv.next39.1, %._crit_edge5.us.us ]
  %69 = load double, double* %61, align 8
  %70 = fmul double %69, %3
  %71 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv40, i64 %indvars.iv38
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv38
  %75 = load double, double* %74, align 8
  %76 = fadd double %73, %75
  store double %76, double* %74, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %77 = load double, double* %61, align 8
  %78 = fmul double %77, %3
  %79 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv40, i64 %indvars.iv.next39
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv.next39
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  store double %84, double* %82, align 8
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, 2
  %85 = icmp slt i64 %indvars.iv.next39.1, %16
  br i1 %85, label %._crit_edge5.us.us, label %._crit_edge5._crit_edge.us.us.unr-lcssa

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader, %._crit_edge.preheader.preheader.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr, %._crit_edge.preheader.preheader.new ], [ %indvars.iv.next53.7, %._crit_edge.preheader ]
  %indvars.iv.next53.7 = add nsw i64 %indvars.iv52, 8
  %86 = icmp slt i64 %indvars.iv.next53.7, %12
  br i1 %86, label %._crit_edge.preheader, label %._crit_edge.loopexit61.unr-lcssa

._crit_edge.loopexit:                             ; preds = %._crit_edge4._crit_edge.us
  br label %._crit_edge

._crit_edge.loopexit61.unr-lcssa:                 ; preds = %._crit_edge.preheader
  br label %._crit_edge.loopexit61

._crit_edge.loopexit61:                           ; preds = %._crit_edge.preheader.prol.loopexit, %._crit_edge.loopexit61.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit61, %._crit_edge.loopexit, %8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %._crit_edge.preheader.us.preheader, label %._crit_edge13

._crit_edge.preheader.us.preheader:               ; preds = %3
  %10 = sext i32 %0 to i64
  %11 = zext i32 %1 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge._crit_edge.us ]
  %12 = mul nsw i64 %10, %indvars.iv11
  br label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %13 = add nsw i64 %12, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge2.us

; <label>:17:                                     ; preds = %._crit_edge2.us._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us._crit_edge, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next, %11
  br i1 %exitcond14, label %._crit_edge._crit_edge.us, label %._crit_edge2.us._crit_edge

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %23 = icmp slt i64 %indvars.iv.next12, %10
  br i1 %23, label %._crit_edge.preheader.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %3
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
!3 = distinct !{!3, !2}
