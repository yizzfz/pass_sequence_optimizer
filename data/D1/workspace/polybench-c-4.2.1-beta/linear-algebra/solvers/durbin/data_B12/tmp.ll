; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  tail call void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call void @kernel_durbin(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call void @print_array(i32 2000, double* %6)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double* nocapture) #2 {
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

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) #2 {
  %4 = bitcast double* %2 to i8*
  %5 = alloca [2000 x double], align 16
  %6 = bitcast [2000 x double]* %5 to i8*
  %7 = load double, double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  store double %8, double* %2, align 8
  %9 = icmp sgt i32 %0, 1
  br i1 %9, label %.lr.ph17.preheader, label %._crit_edge18

.lr.ph17.preheader:                               ; preds = %3
  %10 = load double, double* %1, align 8
  %11 = fsub double -0.000000e+00, %10
  %12 = add i32 %0, -1
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 0
  %wide.trip.count40 = zext i32 %12 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph17.preheader, %._crit_edge12
  %14 = phi double [ %8, %.lr.ph17.preheader ], [ %61, %._crit_edge12 ]
  %indvars.iv38 = phi i64 [ 1, %.lr.ph17.preheader ], [ %indvars.iv.next39, %._crit_edge12 ]
  %indvar36 = phi i64 [ 0, %.lr.ph17.preheader ], [ %indvar.next37, %._crit_edge12 ]
  %indvar = phi i32 [ 0, %.lr.ph17.preheader ], [ %21, %._crit_edge12 ]
  %.0314 = phi double [ %11, %.lr.ph17.preheader ], [ %61, %._crit_edge12 ]
  %.0413 = phi double [ 1.000000e+00, %.lr.ph17.preheader ], [ %20, %._crit_edge12 ]
  %15 = add i64 %indvar36, -1
  %16 = shl i64 %indvar36, 3
  %17 = add nuw nsw i64 %16, 8
  %18 = fmul double %.0314, %.0314
  %19 = fsub double 1.000000e+00, %18
  %20 = fmul double %.0413, %19
  %21 = add nuw nsw i32 %indvar, 1
  %22 = add nsw i64 %indvars.iv38, -1
  %xtraiter = and i32 %21, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.025.prol = phi double [ %29, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %23 = sub nsw i64 %22, %indvars.iv.prol
  %24 = getelementptr inbounds double, double* %1, i64 %23
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %.025.prol, %28
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  %30 = icmp ult i32 %indvar, 3
  br i1 %30, label %.lr.ph9, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.025 = phi double [ %56, %.lr.ph.new ], [ %.025.unr, %.lr.ph.new.preheader ]
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %32 = bitcast double* %31 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = sub nsw i64 %22, %indvars.iv.next
  %34 = getelementptr inbounds double, double* %1, i64 %33
  %35 = bitcast double* %34 to <2 x double>*
  %36 = load <2 x double>, <2 x double>* %35, align 8
  %37 = load <2 x double>, <2 x double>* %32, align 8
  %38 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %39 = fmul <2 x double> %38, %37
  %40 = extractelement <2 x double> %39, i32 0
  %41 = extractelement <2 x double> %39, i32 1
  %42 = fadd double %.025, %40
  %43 = fadd double %42, %41
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %44 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %45 = bitcast double* %44 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %46 = sub nsw i64 %22, %indvars.iv.next.2
  %47 = getelementptr inbounds double, double* %1, i64 %46
  %48 = bitcast double* %47 to <2 x double>*
  %49 = load <2 x double>, <2 x double>* %48, align 8
  %50 = load <2 x double>, <2 x double>* %45, align 8
  %51 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %52 = fmul <2 x double> %51, %50
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %55 = fadd double %43, %53
  %56 = fadd double %55, %54
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv38
  br i1 %exitcond.3, label %.lr.ph9.loopexit, label %.lr.ph.new

.lr.ph9.loopexit:                                 ; preds = %.lr.ph.new
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %56, %.lr.ph9.loopexit ]
  %57 = getelementptr inbounds double, double* %1, i64 %indvars.iv38
  %58 = load double, double* %57, align 8
  %59 = fadd double %.lcssa, %58
  %60 = fsub double -0.000000e+00, %59
  %61 = fdiv double %60, %20
  %62 = and i32 %indvar, 1
  %lcmp.mod29 = icmp eq i32 %62, 0
  br i1 %lcmp.mod29, label %.prol.preheader26, label %.prol.loopexit27

.prol.preheader26:                                ; preds = %.lr.ph9
  %63 = load double, double* %2, align 8
  %64 = fmul double %61, %14
  %65 = fadd double %63, %64
  store double %65, double* %13, align 16
  br label %.prol.loopexit27

.prol.loopexit27:                                 ; preds = %.prol.preheader26, %.lr.ph9
  %indvars.iv21.unr.ph = phi i64 [ 1, %.prol.preheader26 ], [ 0, %.lr.ph9 ]
  %66 = icmp eq i32 %indvar, 0
  br i1 %66, label %._crit_edge12, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit27
  %67 = sub i64 %15, %indvars.iv21.unr.ph
  %68 = lshr i64 %67, 1
  %69 = and i64 %68, 1
  %lcmp.mod48 = icmp eq i64 %69, 0
  br i1 %lcmp.mod48, label %.lr.ph9.new.prol.preheader, label %.lr.ph9.new.prol.loopexit.unr-lcssa

.lr.ph9.new.prol.preheader:                       ; preds = %.lr.ph9.new.preheader
  br label %.lr.ph9.new.prol

.lr.ph9.new.prol:                                 ; preds = %.lr.ph9.new.prol.preheader
  %70 = getelementptr inbounds double, double* %2, i64 %indvars.iv21.unr.ph
  %71 = bitcast double* %70 to <2 x double>*
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv21.unr.ph
  %indvars.iv.next22.prol = add nuw nsw i64 %indvars.iv21.unr.ph, 1
  %73 = load <2 x double>, <2 x double>* %71, align 8
  %74 = sub nsw i64 %22, %indvars.iv.next22.prol
  %75 = getelementptr inbounds double, double* %2, i64 %74
  %76 = bitcast double* %75 to <2 x double>*
  %77 = load <2 x double>, <2 x double>* %76, align 8
  %78 = insertelement <2 x double> undef, double %61, i32 0
  %79 = shufflevector <2 x double> %78, <2 x double> undef, <2 x i32> zeroinitializer
  %80 = fmul <2 x double> %79, %77
  %81 = shufflevector <2 x double> %80, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %82 = fadd <2 x double> %73, %81
  %83 = bitcast double* %72 to <2 x double>*
  store <2 x double> %82, <2 x double>* %83, align 8
  %indvars.iv.next22.1.prol = or i64 %indvars.iv21.unr.ph, 2
  br label %.lr.ph9.new.prol.loopexit.unr-lcssa

.lr.ph9.new.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph9.new.preheader, %.lr.ph9.new.prol
  %indvars.iv21.unr.ph49 = phi i64 [ %indvars.iv.next22.1.prol, %.lr.ph9.new.prol ], [ %indvars.iv21.unr.ph, %.lr.ph9.new.preheader ]
  br label %.lr.ph9.new.prol.loopexit

.lr.ph9.new.prol.loopexit:                        ; preds = %.lr.ph9.new.prol.loopexit.unr-lcssa
  %84 = icmp eq i64 %68, 0
  br i1 %84, label %._crit_edge12.loopexit, label %.lr.ph9.new.preheader.new

.lr.ph9.new.preheader.new:                        ; preds = %.lr.ph9.new.prol.loopexit
  %85 = insertelement <2 x double> undef, double %61, i32 0
  %86 = shufflevector <2 x double> %85, <2 x double> undef, <2 x i32> zeroinitializer
  %87 = insertelement <2 x double> undef, double %61, i32 0
  %88 = shufflevector <2 x double> %87, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new, %.lr.ph9.new.preheader.new
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph49, %.lr.ph9.new.preheader.new ], [ %indvars.iv.next22.1.1, %.lr.ph9.new ]
  %89 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %90 = bitcast double* %89 to <2 x double>*
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv21
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %92 = load <2 x double>, <2 x double>* %90, align 8
  %93 = sub nsw i64 %22, %indvars.iv.next22
  %94 = getelementptr inbounds double, double* %2, i64 %93
  %95 = bitcast double* %94 to <2 x double>*
  %96 = load <2 x double>, <2 x double>* %95, align 8
  %97 = fmul <2 x double> %86, %96
  %98 = shufflevector <2 x double> %97, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %99 = fadd <2 x double> %92, %98
  %100 = bitcast double* %91 to <2 x double>*
  store <2 x double> %99, <2 x double>* %100, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %101 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next22.1
  %102 = bitcast double* %101 to <2 x double>*
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv.next22.1
  %indvars.iv.next22.150 = add nsw i64 %indvars.iv21, 3
  %104 = load <2 x double>, <2 x double>* %102, align 8
  %105 = sub nsw i64 %22, %indvars.iv.next22.150
  %106 = getelementptr inbounds double, double* %2, i64 %105
  %107 = bitcast double* %106 to <2 x double>*
  %108 = load <2 x double>, <2 x double>* %107, align 8
  %109 = fmul <2 x double> %88, %108
  %110 = shufflevector <2 x double> %109, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %111 = fadd <2 x double> %104, %110
  %112 = bitcast double* %103 to <2 x double>*
  store <2 x double> %111, <2 x double>* %112, align 8
  %indvars.iv.next22.1.1 = add nsw i64 %indvars.iv21, 4
  %exitcond.1.1 = icmp eq i64 %indvars.iv.next22.1.1, %indvars.iv38
  br i1 %exitcond.1.1, label %._crit_edge12.loopexit.unr-lcssa, label %.lr.ph9.new

._crit_edge12.loopexit.unr-lcssa:                 ; preds = %.lr.ph9.new
  br label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %.lr.ph9.new.prol.loopexit, %._crit_edge12.loopexit.unr-lcssa
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.prol.loopexit27
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* nonnull %6, i64 %17, i32 8, i1 false)
  %113 = getelementptr inbounds double, double* %2, i64 %indvars.iv38
  store double %61, double* %113, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %indvar.next37 = add nuw nsw i64 %indvar36, 1
  %exitcond = icmp eq i64 %indvar.next37, %wide.trip.count40
  br i1 %exitcond, label %._crit_edge18.loopexit, label %.lr.ph

._crit_edge18.loopexit:                           ; preds = %._crit_edge12
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %3
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %13
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %11, %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
