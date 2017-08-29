; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  tail call fastcc void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %4 = add nsw i32 %0, 1
  %5 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %6 = trunc i64 %indvars.iv.prol to i32
  %7 = sub i32 %4, %6
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  store double %8, double* %9, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %10 = icmp ult i32 %5, 3
  br i1 %10, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %11 = trunc i64 %indvars.iv to i32
  %12 = sub i32 %4, %11
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = bitcast double* %14 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = trunc i64 %indvars.iv.next to i32
  %17 = sub i32 %4, %16
  %18 = sitofp i32 %17 to double
  %19 = insertelement <2 x double> undef, double %13, i32 0
  %20 = insertelement <2 x double> %19, double %18, i32 1
  store <2 x double> %20, <2 x double>* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %21 = trunc i64 %indvars.iv.next.1 to i32
  %22 = sub i32 %4, %21
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %25 = bitcast double* %24 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %26 = trunc i64 %indvars.iv.next.2 to i32
  %27 = sub i32 %4, %26
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  store <2 x double> %30, <2 x double>* %25, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %4 = alloca [2000 x double], align 16
  %5 = load double, double* %1, align 8
  %6 = fsub double -0.000000e+00, %5
  store double %6, double* %2, align 8
  %7 = icmp sgt i32 %0, 1
  br i1 %7, label %.lr.ph19.preheader, label %._crit_edge20

.lr.ph19.preheader:                               ; preds = %3
  %8 = load double, double* %1, align 8
  %9 = fsub double -0.000000e+00, %8
  %10 = add i32 %0, -1
  %sunkaddr = ptrtoint double* %2 to i64
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 0
  %12 = bitcast [2000 x double]* %4 to i8*
  %13 = bitcast double* %2 to i8*
  %wide.trip.count43 = zext i32 %10 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph19.preheader, %._crit_edge._crit_edge
  %indvars.iv41 = phi i64 [ 1, %.lr.ph19.preheader ], [ %indvars.iv.next42, %._crit_edge._crit_edge ]
  %indvar39 = phi i64 [ 0, %.lr.ph19.preheader ], [ %indvar.next40, %._crit_edge._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph19.preheader ], [ %20, %._crit_edge._crit_edge ]
  %.0315 = phi double [ %9, %.lr.ph19.preheader ], [ %60, %._crit_edge._crit_edge ]
  %.0414 = phi double [ 1.000000e+00, %.lr.ph19.preheader ], [ %19, %._crit_edge._crit_edge ]
  %14 = add i64 %indvar39, -1
  %15 = shl i64 %indvar39, 3
  %16 = add nuw nsw i64 %15, 8
  %17 = fmul double %.0315, %.0315
  %18 = fsub double 1.000000e+00, %17
  %19 = fmul double %.0414, %18
  %20 = add nuw nsw i32 %indvar, 1
  %21 = add nsw i64 %indvars.iv41, -1
  %xtraiter = and i32 %20, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.025.prol = phi double [ %28, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %22 = sub nsw i64 %21, %indvars.iv.prol
  %23 = getelementptr inbounds double, double* %1, i64 %22
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %.025.prol, %27
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %28, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %28, %.prol.loopexit.loopexit ]
  %29 = icmp ult i32 %indvar, 3
  br i1 %29, label %.lr.ph11, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.025 = phi double [ %55, %.lr.ph.new ], [ %.025.unr, %.lr.ph.new.preheader ]
  %30 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %31 = bitcast double* %30 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = sub nsw i64 %21, %indvars.iv.next
  %33 = getelementptr inbounds double, double* %1, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %35 = load <2 x double>, <2 x double>* %34, align 8
  %36 = load <2 x double>, <2 x double>* %31, align 8
  %37 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %38 = fmul <2 x double> %37, %36
  %39 = extractelement <2 x double> %38, i32 0
  %40 = extractelement <2 x double> %38, i32 1
  %41 = fadd double %.025, %39
  %42 = fadd double %41, %40
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %43 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %44 = bitcast double* %43 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %45 = sub nsw i64 %21, %indvars.iv.next.2
  %46 = getelementptr inbounds double, double* %1, i64 %45
  %47 = bitcast double* %46 to <2 x double>*
  %48 = load <2 x double>, <2 x double>* %47, align 8
  %49 = load <2 x double>, <2 x double>* %44, align 8
  %50 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %51 = fmul <2 x double> %50, %49
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %54 = fadd double %42, %52
  %55 = fadd double %54, %53
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv41
  br i1 %exitcond.3, label %.lr.ph11.loopexit, label %.lr.ph.new

.lr.ph11.loopexit:                                ; preds = %.lr.ph.new
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %.lr.ph11.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %55, %.lr.ph11.loopexit ]
  %56 = getelementptr inbounds double, double* %1, i64 %indvars.iv41
  %57 = load double, double* %56, align 8
  %58 = fadd double %.lcssa, %57
  %59 = fsub double -0.000000e+00, %58
  %60 = fdiv double %59, %19
  %61 = and i32 %indvar, 1
  %lcmp.mod32 = icmp eq i32 %61, 0
  br i1 %lcmp.mod32, label %.prol.preheader29, label %.prol.loopexit30

.prol.preheader29:                                ; preds = %.lr.ph11
  %62 = load double, double* %2, align 8
  %sunkaddr44 = shl i64 %indvars.iv41, 3
  %sunkaddr45 = add i64 %sunkaddr, %sunkaddr44
  %sunkaddr46 = add i64 %sunkaddr45, -8
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to double*
  %63 = load double, double* %sunkaddr47, align 8
  %64 = fmul double %60, %63
  %65 = fadd double %62, %64
  store double %65, double* %11, align 16
  br label %.prol.loopexit30

.prol.loopexit30:                                 ; preds = %.prol.preheader29, %.lr.ph11
  %indvars.iv24.unr.ph = phi i64 [ 1, %.prol.preheader29 ], [ 0, %.lr.ph11 ]
  %66 = icmp eq i32 %indvar, 0
  br i1 %66, label %._crit_edge._crit_edge, label %.lr.ph11.new.preheader

.lr.ph11.new.preheader:                           ; preds = %.prol.loopexit30
  %67 = sub i64 %14, %indvars.iv24.unr.ph
  %68 = lshr i64 %67, 1
  %69 = and i64 %68, 1
  %lcmp.mod55 = icmp eq i64 %69, 0
  br i1 %lcmp.mod55, label %.lr.ph11.new.prol.preheader, label %.lr.ph11.new.prol.loopexit.unr-lcssa

.lr.ph11.new.prol.preheader:                      ; preds = %.lr.ph11.new.preheader
  %70 = getelementptr inbounds double, double* %2, i64 %indvars.iv24.unr.ph
  %71 = bitcast double* %70 to <2 x double>*
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv24.unr.ph
  %indvars.iv.next25.prol = add nuw nsw i64 %indvars.iv24.unr.ph, 1
  %73 = load <2 x double>, <2 x double>* %71, align 8
  %74 = sub nsw i64 %21, %indvars.iv.next25.prol
  %75 = getelementptr inbounds double, double* %2, i64 %74
  %76 = bitcast double* %75 to <2 x double>*
  %77 = load <2 x double>, <2 x double>* %76, align 8
  %78 = insertelement <2 x double> undef, double %60, i32 0
  %79 = shufflevector <2 x double> %78, <2 x double> undef, <2 x i32> zeroinitializer
  %80 = fmul <2 x double> %79, %77
  %81 = shufflevector <2 x double> %80, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %82 = fadd <2 x double> %73, %81
  %83 = bitcast double* %72 to <2 x double>*
  store <2 x double> %82, <2 x double>* %83, align 8
  %indvars.iv.next25.1.prol = or i64 %indvars.iv24.unr.ph, 2
  br label %.lr.ph11.new.prol.loopexit.unr-lcssa

.lr.ph11.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph11.new.preheader, %.lr.ph11.new.prol.preheader
  %indvars.iv24.unr.ph56 = phi i64 [ %indvars.iv.next25.1.prol, %.lr.ph11.new.prol.preheader ], [ %indvars.iv24.unr.ph, %.lr.ph11.new.preheader ]
  %84 = icmp eq i64 %68, 0
  br i1 %84, label %._crit_edge._crit_edge.loopexit, label %.lr.ph11.new.preheader.new

.lr.ph11.new.preheader.new:                       ; preds = %.lr.ph11.new.prol.loopexit.unr-lcssa
  %85 = insertelement <2 x double> undef, double %60, i32 0
  %86 = shufflevector <2 x double> %85, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph11.new

.lr.ph11.new:                                     ; preds = %.lr.ph11.new, %.lr.ph11.new.preheader.new
  %indvars.iv24 = phi i64 [ %indvars.iv24.unr.ph56, %.lr.ph11.new.preheader.new ], [ %indvars.iv.next25.1.1, %.lr.ph11.new ]
  %87 = getelementptr inbounds double, double* %2, i64 %indvars.iv24
  %88 = bitcast double* %87 to <2 x double>*
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv24
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %90 = load <2 x double>, <2 x double>* %88, align 8
  %91 = sub nsw i64 %21, %indvars.iv.next25
  %92 = getelementptr inbounds double, double* %2, i64 %91
  %93 = bitcast double* %92 to <2 x double>*
  %94 = load <2 x double>, <2 x double>* %93, align 8
  %95 = fmul <2 x double> %86, %94
  %96 = shufflevector <2 x double> %95, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %97 = fadd <2 x double> %90, %96
  %98 = bitcast double* %89 to <2 x double>*
  store <2 x double> %97, <2 x double>* %98, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %99 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next25.1
  %100 = bitcast double* %99 to <2 x double>*
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv.next25.1
  %indvars.iv.next25.157 = add nsw i64 %indvars.iv24, 3
  %102 = load <2 x double>, <2 x double>* %100, align 8
  %103 = sub nsw i64 %21, %indvars.iv.next25.157
  %104 = getelementptr inbounds double, double* %2, i64 %103
  %105 = bitcast double* %104 to <2 x double>*
  %106 = load <2 x double>, <2 x double>* %105, align 8
  %107 = fmul <2 x double> %86, %106
  %108 = shufflevector <2 x double> %107, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %109 = fadd <2 x double> %102, %108
  %110 = bitcast double* %101 to <2 x double>*
  store <2 x double> %109, <2 x double>* %110, align 8
  %indvars.iv.next25.1.1 = add nsw i64 %indvars.iv24, 4
  %exitcond.1.1 = icmp eq i64 %indvars.iv.next25.1.1, %indvars.iv41
  br i1 %exitcond.1.1, label %._crit_edge._crit_edge.loopexit.unr-lcssa, label %.lr.ph11.new

._crit_edge._crit_edge.loopexit.unr-lcssa:        ; preds = %.lr.ph11.new
  br label %._crit_edge._crit_edge.loopexit

._crit_edge._crit_edge.loopexit:                  ; preds = %.lr.ph11.new.prol.loopexit.unr-lcssa, %._crit_edge._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge._crit_edge.loopexit, %.prol.loopexit30
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* nonnull %12, i64 %16, i32 8, i1 false)
  %111 = getelementptr inbounds double, double* %2, i64 %indvars.iv41
  store double %60, double* %111, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %indvar.next40 = add nuw nsw i64 %indvar39, 1
  %exitcond = icmp eq i64 %indvar.next40, %wide.trip.count43
  br i1 %exitcond, label %._crit_edge20.loopexit, label %.lr.ph

._crit_edge20.loopexit:                           ; preds = %._crit_edge._crit_edge
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %3
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge3

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.loopexit, label %.lr.ph

._crit_edge3.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %2
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
