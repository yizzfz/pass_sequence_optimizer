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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
  %12 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(i32 2000, double* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*) unnamed_addr #2 {
.lr.ph:
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.3, %.lr.ph.new ]
  %2 = trunc i64 %indvars.iv to i32
  %3 = sub i32 2001, %2
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %6 = bitcast double* %5 to <2 x double>*
  %7 = or i32 %2, 1
  %8 = sub i32 2001, %7
  %9 = sitofp i32 %8 to double
  %10 = insertelement <2 x double> undef, double %4, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  store <2 x double> %11, <2 x double>* %6, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %12 = trunc i64 %indvars.iv.next.1 to i32
  %13 = sub i32 2001, %12
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %16 = bitcast double* %15 to <2 x double>*
  %17 = or i32 %2, 3
  %18 = sub i32 2001, %17
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %14, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  store <2 x double> %21, <2 x double>* %16, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double*, double*) unnamed_addr #2 {
.lr.ph20.preheader:
  %3 = alloca [2000 x double], align 16
  %4 = load double, double* %1, align 8
  %5 = fsub double -0.000000e+00, %4
  store double %5, double* %2, align 8
  %6 = load double, double* %1, align 8
  %7 = fsub double -0.000000e+00, %6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge17..lr.ph_crit_edge, %.lr.ph20.preheader
  %8 = phi double [ %5, %.lr.ph20.preheader ], [ %59, %._crit_edge17..lr.ph_crit_edge ]
  %indvars.iv44 = phi i64 [ 1, %.lr.ph20.preheader ], [ %indvars.iv.next45, %._crit_edge17..lr.ph_crit_edge ]
  %indvar42 = phi i64 [ 0, %.lr.ph20.preheader ], [ %indvar.next43, %._crit_edge17..lr.ph_crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph20.preheader ], [ %17, %._crit_edge17..lr.ph_crit_edge ]
  %9 = phi double [ %7, %.lr.ph20.preheader ], [ %59, %._crit_edge17..lr.ph_crit_edge ]
  %10 = phi double [ 1.000000e+00, %.lr.ph20.preheader ], [ %16, %._crit_edge17..lr.ph_crit_edge ]
  %11 = add i64 %indvar42, -1
  %12 = shl i64 %indvar42, 3
  %13 = add nuw nsw i64 %12, 8
  %14 = fmul double %9, %9
  %15 = fsub double 1.000000e+00, %14
  %16 = fmul double %10, %15
  %17 = add nuw nsw i32 %indvar, 1
  %18 = add nsw i64 %indvars.iv44, -1
  %xtraiter = and i32 %17, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %19 = phi double [ %26, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %20 = sub nsw i64 %18, %indvars.iv.prol
  %21 = getelementptr inbounds double, double* %1, i64 %20
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %19, %25
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.preheader ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %26, %.prol.preheader ]
  %.lcssa24.unr = phi double [ undef, %.lr.ph ], [ %26, %.prol.preheader ]
  %27 = icmp ult i32 %indvar, 3
  br i1 %27, label %.lr.ph13, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %28 = phi double [ %54, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %29 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %30 = bitcast double* %29 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = sub nsw i64 %18, %indvars.iv.next
  %32 = getelementptr inbounds double, double* %1, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  %34 = load <2 x double>, <2 x double>* %33, align 8
  %35 = load <2 x double>, <2 x double>* %30, align 8
  %36 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %37 = fmul <2 x double> %36, %35
  %38 = extractelement <2 x double> %37, i32 0
  %39 = extractelement <2 x double> %37, i32 1
  %40 = fadd double %28, %38
  %41 = fadd double %40, %39
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %42 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %43 = bitcast double* %42 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %44 = sub nsw i64 %18, %indvars.iv.next.2
  %45 = getelementptr inbounds double, double* %1, i64 %44
  %46 = bitcast double* %45 to <2 x double>*
  %47 = load <2 x double>, <2 x double>* %46, align 8
  %48 = load <2 x double>, <2 x double>* %43, align 8
  %49 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %50 = fmul <2 x double> %49, %48
  %51 = extractelement <2 x double> %50, i32 0
  %52 = extractelement <2 x double> %50, i32 1
  %53 = fadd double %41, %51
  %54 = fadd double %53, %52
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv44
  br i1 %exitcond.3, label %.lr.ph13, label %.lr.ph.new

.lr.ph13:                                         ; preds = %.lr.ph.new, %.prol.loopexit
  %.lcssa24 = phi double [ %.lcssa24.unr, %.prol.loopexit ], [ %54, %.lr.ph.new ]
  %55 = getelementptr inbounds double, double* %1, i64 %indvars.iv44
  %56 = load double, double* %55, align 8
  %57 = fadd double %.lcssa24, %56
  %58 = fsub double -0.000000e+00, %57
  %59 = fdiv double %58, %16
  %60 = and i32 %indvar, 1
  %lcmp.mod35 = icmp eq i32 %60, 0
  br i1 %lcmp.mod35, label %.prol.preheader32, label %.prol.loopexit33

.prol.preheader32:                                ; preds = %.lr.ph13
  %61 = bitcast [2000 x double]* %3 to double*
  %62 = load double, double* %2, align 8
  %63 = fmul double %59, %8
  %64 = fadd double %62, %63
  store double %64, double* %61, align 16
  br label %.prol.loopexit33

.prol.loopexit33:                                 ; preds = %.lr.ph13, %.prol.preheader32
  %indvars.iv27.unr.ph = phi i64 [ 1, %.prol.preheader32 ], [ 0, %.lr.ph13 ]
  %65 = icmp eq i32 %indvar, 0
  br i1 %65, label %._crit_edge17, label %.lr.ph13.new.preheader

.lr.ph13.new.preheader:                           ; preds = %.prol.loopexit33
  %66 = sub i64 %11, %indvars.iv27.unr.ph
  %67 = lshr i64 %66, 1
  %68 = and i64 %67, 1
  %lcmp.mod52 = icmp eq i64 %68, 0
  br i1 %lcmp.mod52, label %.lr.ph13.new.prol, label %.lr.ph13.new.prol.loopexit

.lr.ph13.new.prol:                                ; preds = %.lr.ph13.new.preheader
  %69 = getelementptr inbounds double, double* %2, i64 %indvars.iv27.unr.ph
  %70 = bitcast double* %69 to <2 x double>*
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv27.unr.ph
  %indvars.iv.next28.prol = add nuw nsw i64 %indvars.iv27.unr.ph, 1
  %72 = load <2 x double>, <2 x double>* %70, align 8
  %73 = sub nsw i64 %18, %indvars.iv.next28.prol
  %74 = getelementptr inbounds double, double* %2, i64 %73
  %75 = bitcast double* %74 to <2 x double>*
  %76 = load <2 x double>, <2 x double>* %75, align 8
  %77 = insertelement <2 x double> undef, double %59, i32 0
  %78 = shufflevector <2 x double> %77, <2 x double> undef, <2 x i32> zeroinitializer
  %79 = fmul <2 x double> %78, %76
  %80 = shufflevector <2 x double> %79, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %81 = fadd <2 x double> %72, %80
  %82 = bitcast double* %71 to <2 x double>*
  store <2 x double> %81, <2 x double>* %82, align 8
  %indvars.iv.next28.1.prol = or i64 %indvars.iv27.unr.ph, 2
  br label %.lr.ph13.new.prol.loopexit

.lr.ph13.new.prol.loopexit:                       ; preds = %.lr.ph13.new.prol, %.lr.ph13.new.preheader
  %indvars.iv27.unr.ph53 = phi i64 [ %indvars.iv.next28.1.prol, %.lr.ph13.new.prol ], [ %indvars.iv27.unr.ph, %.lr.ph13.new.preheader ]
  %83 = icmp eq i64 %67, 0
  br i1 %83, label %._crit_edge17, label %.lr.ph13.new.preheader.new

.lr.ph13.new.preheader.new:                       ; preds = %.lr.ph13.new.prol.loopexit
  %84 = insertelement <2 x double> undef, double %59, i32 0
  %85 = shufflevector <2 x double> %84, <2 x double> undef, <2 x i32> zeroinitializer
  %86 = insertelement <2 x double> undef, double %59, i32 0
  %87 = shufflevector <2 x double> %86, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph13.new

.lr.ph13.new:                                     ; preds = %.lr.ph13.new, %.lr.ph13.new.preheader.new
  %indvars.iv27 = phi i64 [ %indvars.iv27.unr.ph53, %.lr.ph13.new.preheader.new ], [ %indvars.iv.next28.1.1, %.lr.ph13.new ]
  %88 = getelementptr inbounds double, double* %2, i64 %indvars.iv27
  %89 = bitcast double* %88 to <2 x double>*
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv27
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %91 = load <2 x double>, <2 x double>* %89, align 8
  %92 = sub nsw i64 %18, %indvars.iv.next28
  %93 = getelementptr inbounds double, double* %2, i64 %92
  %94 = bitcast double* %93 to <2 x double>*
  %95 = load <2 x double>, <2 x double>* %94, align 8
  %96 = fmul <2 x double> %85, %95
  %97 = shufflevector <2 x double> %96, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %98 = fadd <2 x double> %91, %97
  %99 = bitcast double* %90 to <2 x double>*
  store <2 x double> %98, <2 x double>* %99, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %100 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next28.1
  %101 = bitcast double* %100 to <2 x double>*
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv.next28.1
  %indvars.iv.next28.154 = add nsw i64 %indvars.iv27, 3
  %103 = load <2 x double>, <2 x double>* %101, align 8
  %104 = sub nsw i64 %18, %indvars.iv.next28.154
  %105 = getelementptr inbounds double, double* %2, i64 %104
  %106 = bitcast double* %105 to <2 x double>*
  %107 = load <2 x double>, <2 x double>* %106, align 8
  %108 = fmul <2 x double> %87, %107
  %109 = shufflevector <2 x double> %108, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %110 = fadd <2 x double> %103, %109
  %111 = bitcast double* %102 to <2 x double>*
  store <2 x double> %110, <2 x double>* %111, align 8
  %indvars.iv.next28.1.1 = add nsw i64 %indvars.iv27, 4
  %exitcond.1.1 = icmp eq i64 %indvars.iv.next28.1.1, %indvars.iv44
  br i1 %exitcond.1.1, label %._crit_edge17, label %.lr.ph13.new

._crit_edge17:                                    ; preds = %.lr.ph13.new.prol.loopexit, %.lr.ph13.new, %.prol.loopexit33
  %112 = bitcast [2000 x double]* %3 to i8*
  %113 = bitcast double* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %113, i8* nonnull %112, i64 %13, i32 8, i1 false)
  %114 = getelementptr inbounds double, double* %2, i64 %indvars.iv44
  store double %59, double* %114, align 8
  %indvar.next43 = add nuw nsw i64 %indvar42, 1
  %exitcond = icmp eq i64 %indvar.next43, 1999
  br i1 %exitcond, label %._crit_edge21, label %._crit_edge17..lr.ph_crit_edge

._crit_edge17..lr.ph_crit_edge:                   ; preds = %._crit_edge17
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  br label %.lr.ph

._crit_edge21:                                    ; preds = %._crit_edge17
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %.lr.ph._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #6
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
