; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %22, %4
  %indvars.iv13 = phi i64 [ 0, %4 ], [ %indvars.iv.next14, %22 ]
  %5 = trunc i64 %indvars.iv13 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv13
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = fadd <2 x double> %8, %19
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1400
  br i1 %exitcond15, label %23, label %.preheader

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br i1 true, label %.lr.ph131, label %.preheader106

.lr.ph131:                                        ; preds = %7
  br i1 true, label %.lr.ph131.split.us.preheader, label %.lr.ph131.split.preheader

.lr.ph131.split.preheader:                        ; preds = %.lr.ph131
  br i1 undef, label %.lr.ph131.split.prol.loopexit, label %.lr.ph131.split.prol.preheader

.lr.ph131.split.prol.preheader:                   ; preds = %.lr.ph131.split.preheader
  br label %.lr.ph131.split.prol

.lr.ph131.split.prol:                             ; preds = %.lr.ph131.split.prol.preheader, %.lr.ph131.split.prol
  br i1 true, label %.lr.ph131.split.prol.loopexit.loopexit, label %.lr.ph131.split.prol, !llvm.loop !1

.lr.ph131.split.prol.loopexit.loopexit:           ; preds = %.lr.ph131.split.prol
  br label %.lr.ph131.split.prol.loopexit

.lr.ph131.split.prol.loopexit:                    ; preds = %.lr.ph131.split.prol.loopexit.loopexit, %.lr.ph131.split.preheader
  br i1 undef, label %.preheader107, label %.lr.ph131.split.preheader209

.lr.ph131.split.preheader209:                     ; preds = %.lr.ph131.split.prol.loopexit
  br i1 undef, label %.lr.ph131.split.prol.preheader271, label %.lr.ph131.split.prol.loopexit272

.lr.ph131.split.prol.preheader271:                ; preds = %.lr.ph131.split.preheader209
  br label %.lr.ph131.split.prol274

.lr.ph131.split.prol274:                          ; preds = %.lr.ph131.split.prol274, %.lr.ph131.split.prol.preheader271
  br i1 false, label %.lr.ph131.split.prol274, label %.lr.ph131.split.prol.loopexit272.unr-lcssa, !llvm.loop !3

.lr.ph131.split.prol.loopexit272.unr-lcssa:       ; preds = %.lr.ph131.split.prol274
  br label %.lr.ph131.split.prol.loopexit272

.lr.ph131.split.prol.loopexit272:                 ; preds = %.lr.ph131.split.prol.loopexit272.unr-lcssa, %.lr.ph131.split.preheader209
  br i1 undef, label %.preheader107.loopexit270, label %.lr.ph131.split.preheader209.new

.lr.ph131.split.preheader209.new:                 ; preds = %.lr.ph131.split.prol.loopexit272
  br label %.lr.ph131.split

.lr.ph131.split.us.preheader:                     ; preds = %.lr.ph131
  %sunkaddr240 = ptrtoint double* %5 to i64
  %sunkaddr236 = ptrtoint double* %5 to i64
  br label %.lr.ph131.split.us

.lr.ph131.split.us:                               ; preds = %.lr.ph131.split.us.preheader, %._crit_edge128.us
  %indvars.iv162.us = phi i64 [ %indvars.iv.next163.us, %._crit_edge128.us ], [ 0, %.lr.ph131.split.us.preheader ]
  %8 = getelementptr inbounds double, double* %5, i64 %indvars.iv162.us
  store double 0.000000e+00, double* %8, align 8
  br i1 true, label %.prol.loopexit197, label %.prol.preheader196.preheader

.prol.preheader196.preheader:                     ; preds = %.lr.ph131.split.us
  br label %.prol.preheader196

.prol.preheader196:                               ; preds = %.prol.preheader196.preheader, %.prol.preheader196
  br i1 true, label %.prol.loopexit197.loopexit, label %.prol.preheader196, !llvm.loop !4

.prol.loopexit197.loopexit:                       ; preds = %.prol.preheader196
  br label %.prol.loopexit197

.prol.loopexit197:                                ; preds = %.prol.loopexit197.loopexit, %.lr.ph131.split.us
  br i1 false, label %._crit_edge128.us, label %.lr.ph131.split.us.new.preheader

.lr.ph131.split.us.new.preheader:                 ; preds = %.prol.loopexit197
  %sunkaddr237 = shl i64 %indvars.iv162.us, 3
  %sunkaddr238 = add i64 %sunkaddr236, %sunkaddr237
  %sunkaddr239 = inttoptr i64 %sunkaddr238 to double*
  br label %.lr.ph131.split.us.new

.lr.ph131.split.us.new:                           ; preds = %.lr.ph131.split.us.new.preheader, %.lr.ph131.split.us.new
  %9 = phi double [ %21, %.lr.ph131.split.us.new ], [ 0.000000e+00, %.lr.ph131.split.us.new.preheader ]
  %indvars.iv158.us = phi i64 [ %indvars.iv.next159.us.3, %.lr.ph131.split.us.new ], [ 0, %.lr.ph131.split.us.new.preheader ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv158.us, i64 %indvars.iv162.us
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %sunkaddr239, align 8
  %indvars.iv.next159.us = or i64 %indvars.iv158.us, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next159.us, i64 %indvars.iv162.us
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr239, align 8
  %indvars.iv.next159.us.1 = or i64 %indvars.iv158.us, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next159.us.1, i64 %indvars.iv162.us
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr239, align 8
  %indvars.iv.next159.us.2 = or i64 %indvars.iv158.us, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next159.us.2, i64 %indvars.iv162.us
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %sunkaddr239, align 8
  %indvars.iv.next159.us.3 = add nuw nsw i64 %indvars.iv158.us, 4
  %exitcond161.us.3 = icmp eq i64 %indvars.iv.next159.us.3, 1400
  br i1 %exitcond161.us.3, label %._crit_edge128.us.loopexit, label %.lr.ph131.split.us.new

._crit_edge128.us.loopexit:                       ; preds = %.lr.ph131.split.us.new
  br label %._crit_edge128.us

._crit_edge128.us:                                ; preds = %._crit_edge128.us.loopexit, %.prol.loopexit197
  %.lcssa184 = phi double [ undef, %.prol.loopexit197 ], [ %21, %._crit_edge128.us.loopexit ]
  %22 = fdiv double %.lcssa184, %2
  %sunkaddr241 = shl i64 %indvars.iv162.us, 3
  %sunkaddr242 = add i64 %sunkaddr240, %sunkaddr241
  %sunkaddr243 = inttoptr i64 %sunkaddr242 to double*
  store double %22, double* %sunkaddr243, align 8
  %indvars.iv.next163.us = add nuw nsw i64 %indvars.iv162.us, 1
  %exitcond165.us = icmp eq i64 %indvars.iv.next163.us, 1200
  br i1 %exitcond165.us, label %.preheader107.loopexit, label %.lr.ph131.split.us

.preheader107.loopexit:                           ; preds = %._crit_edge128.us
  br label %.preheader107

.preheader107.loopexit270.unr-lcssa:              ; preds = %.lr.ph131.split
  br label %.preheader107.loopexit270

.preheader107.loopexit270:                        ; preds = %.lr.ph131.split.prol.loopexit272, %.preheader107.loopexit270.unr-lcssa
  br label %.preheader107

.preheader107:                                    ; preds = %.preheader107.loopexit270, %.preheader107.loopexit, %.lr.ph131.split.prol.loopexit
  br i1 true, label %.lr.ph124, label %.preheader106

.lr.ph124:                                        ; preds = %.preheader107
  br i1 true, label %.lr.ph124.split.us.preheader, label %.lr.ph124.split.preheader

.lr.ph124.split.us.preheader:                     ; preds = %.lr.ph124
  %sunkaddr260 = ptrtoint double* %6 to i64
  %sunkaddr252 = ptrtoint double* %5 to i64
  %sunkaddr256 = ptrtoint double* %6 to i64
  br label %.lr.ph124.split.us

.lr.ph124.split.preheader:                        ; preds = %.lr.ph124
  br i1 undef, label %.lr.ph124.split.prol.loopexit, label %.lr.ph124.split.prol

.lr.ph124.split.prol:                             ; preds = %.lr.ph124.split.preheader
  br label %.lr.ph124.split.prol.loopexit

.lr.ph124.split.prol.loopexit:                    ; preds = %.lr.ph124.split.preheader, %.lr.ph124.split.prol
  br i1 undef, label %.preheader106, label %.lr.ph124.split.preheader207

.lr.ph124.split.preheader207:                     ; preds = %.lr.ph124.split.prol.loopexit
  br label %.lr.ph124.split

.lr.ph124.split.us:                               ; preds = %.lr.ph124.split.us.preheader, %._crit_edge122.us
  %indvars.iv154.us = phi i64 [ %indvars.iv.next155.us, %._crit_edge122.us ], [ 0, %.lr.ph124.split.us.preheader ]
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv154.us
  store double 0.000000e+00, double* %23, align 8
  br i1 true, label %.prol.loopexit190, label %.prol.preheader189

.prol.preheader189:                               ; preds = %.lr.ph124.split.us
  br label %.prol.loopexit190

.prol.loopexit190:                                ; preds = %.prol.preheader189, %.lr.ph124.split.us
  %indvars.iv150.us.unr.ph = phi i64 [ 1, %.prol.preheader189 ], [ 0, %.lr.ph124.split.us ]
  br i1 false, label %._crit_edge122.us, label %.lr.ph124.split.us.new.preheader

.lr.ph124.split.us.new.preheader:                 ; preds = %.prol.loopexit190
  %sunkaddr253 = shl i64 %indvars.iv154.us, 3
  %sunkaddr254 = add i64 %sunkaddr252, %sunkaddr253
  %sunkaddr255 = inttoptr i64 %sunkaddr254 to double*
  %sunkaddr257 = shl i64 %indvars.iv154.us, 3
  %sunkaddr258 = add i64 %sunkaddr256, %sunkaddr257
  %sunkaddr259 = inttoptr i64 %sunkaddr258 to double*
  br label %.lr.ph124.split.us.new

.lr.ph124.split.us.new:                           ; preds = %.lr.ph124.split.us.new.preheader, %.lr.ph124.split.us.new
  %24 = phi double [ %36, %.lr.ph124.split.us.new ], [ 0.000000e+00, %.lr.ph124.split.us.new.preheader ]
  %indvars.iv150.us = phi i64 [ %indvars.iv.next151.us.1, %.lr.ph124.split.us.new ], [ %indvars.iv150.us.unr.ph, %.lr.ph124.split.us.new.preheader ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv150.us, i64 %indvars.iv154.us
  %26 = load double, double* %25, align 8
  %27 = load double, double* %sunkaddr255, align 8
  %28 = fsub double %26, %27
  %29 = fmul double %28, %28
  %30 = fadd double %24, %29
  store double %30, double* %sunkaddr259, align 8
  %indvars.iv.next151.us = add nuw nsw i64 %indvars.iv150.us, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next151.us, i64 %indvars.iv154.us
  %32 = load double, double* %31, align 8
  %33 = load double, double* %sunkaddr255, align 8
  %34 = fsub double %32, %33
  %35 = fmul double %34, %34
  %36 = fadd double %30, %35
  store double %36, double* %sunkaddr259, align 8
  %indvars.iv.next151.us.1 = add nuw nsw i64 %indvars.iv150.us, 2
  %exitcond153.us.1 = icmp eq i64 %indvars.iv.next151.us.1, 1400
  br i1 %exitcond153.us.1, label %._crit_edge122.us.loopexit, label %.lr.ph124.split.us.new

._crit_edge122.us.loopexit:                       ; preds = %.lr.ph124.split.us.new
  br label %._crit_edge122.us

._crit_edge122.us:                                ; preds = %._crit_edge122.us.loopexit, %.prol.loopexit190
  %.lcssa183 = phi double [ undef, %.prol.loopexit190 ], [ %36, %._crit_edge122.us.loopexit ]
  %37 = fdiv double %.lcssa183, %2
  %sunkaddr261 = shl i64 %indvars.iv154.us, 3
  %sunkaddr262 = add i64 %sunkaddr260, %sunkaddr261
  %sunkaddr263 = inttoptr i64 %sunkaddr262 to double*
  store double %37, double* %sunkaddr263, align 8
  %38 = tail call double @sqrt(double %37) #4
  %39 = fcmp ugt double %38, 1.000000e-01
  %..us = select i1 %39, double %38, double 1.000000e+00
  store double %..us, double* %sunkaddr263, align 8
  %indvars.iv.next155.us = add nuw nsw i64 %indvars.iv154.us, 1
  %exitcond157.us = icmp eq i64 %indvars.iv.next155.us, 1200
  br i1 %exitcond157.us, label %.preheader106.loopexit, label %.lr.ph124.split.us

.lr.ph131.split:                                  ; preds = %.lr.ph131.split, %.lr.ph131.split.preheader209.new
  br i1 true, label %.preheader107.loopexit270.unr-lcssa, label %.lr.ph131.split

.preheader106.loopexit:                           ; preds = %._crit_edge122.us
  br label %.preheader106

.preheader106.loopexit269:                        ; preds = %.lr.ph124.split
  br label %.preheader106

.preheader106:                                    ; preds = %.preheader106.loopexit269, %.preheader106.loopexit, %.lr.ph124.split.prol.loopexit, %7, %.preheader107
  br i1 true, label %.preheader105.lr.ph, label %.preheader

.preheader105.lr.ph:                              ; preds = %.preheader106
  br i1 true, label %.preheader105.us.preheader, label %.preheader.thread

.preheader105.us.preheader:                       ; preds = %.preheader105.lr.ph
  br label %.preheader105.us

.preheader.thread:                                ; preds = %.preheader105.lr.ph
  br label %._crit_edge114

.preheader105.us:                                 ; preds = %.preheader105.us.preheader, %._crit_edge117.us
  %indvars.iv146.us = phi i64 [ %indvars.iv.next147.us, %._crit_edge117.us ], [ 0, %.preheader105.us.preheader ]
  br label %40

; <label>:40:                                     ; preds = %40, %.preheader105.us
  %indvars.iv142.us = phi i64 [ 0, %.preheader105.us ], [ %indvars.iv.next143.us, %40 ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv142.us
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv146.us, i64 %indvars.iv142.us
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %46 = tail call double @sqrt(double %2) #4
  %47 = getelementptr inbounds double, double* %6, i64 %indvars.iv142.us
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %43, align 8
  %51 = fdiv double %50, %49
  store double %51, double* %43, align 8
  %indvars.iv.next143.us = add nuw nsw i64 %indvars.iv142.us, 1
  %exitcond145.us = icmp eq i64 %indvars.iv.next143.us, 1200
  br i1 %exitcond145.us, label %._crit_edge117.us, label %40

._crit_edge117.us:                                ; preds = %40
  %indvars.iv.next147.us = add nuw nsw i64 %indvars.iv146.us, 1
  %exitcond149.us = icmp eq i64 %indvars.iv.next147.us, 1400
  br i1 %exitcond149.us, label %.preheader.loopexit, label %.preheader105.us

.lr.ph124.split:                                  ; preds = %.lr.ph124.split.preheader207, %.lr.ph124.split
  br i1 true, label %.preheader106.loopexit269, label %.lr.ph124.split

.preheader.loopexit:                              ; preds = %._crit_edge117.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader106
  br i1 true, label %.lr.ph113, label %._crit_edge114

.lr.ph113:                                        ; preds = %.preheader
  br i1 true, label %.lr.ph113.split.us.preheader, label %.lr.ph113.split.preheader

.lr.ph113.split.us.preheader:                     ; preds = %.lr.ph113
  br label %.lr.ph113.split.us

.lr.ph113.split.preheader:                        ; preds = %.lr.ph113
  br label %.lr.ph113.split

.lr.ph113.split.us:                               ; preds = %.lr.ph113.split.us.preheader, %.loopexit.us
  %indvars.iv138.us = phi i64 [ %indvars.iv.next139.us, %.loopexit.us ], [ 0, %.lr.ph113.split.us.preheader ]
  %indvars.iv132.us = phi i64 [ %indvars.iv.next133.us, %.loopexit.us ], [ 1, %.lr.ph113.split.us.preheader ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv138.us, i64 %indvars.iv138.us
  store double 1.000000e+00, double* %52, align 8
  %indvars.iv.next139.us = add nuw nsw i64 %indvars.iv138.us, 1
  %53 = icmp slt i64 %indvars.iv.next139.us, 1200
  br i1 %53, label %.lr.ph.us.us.preheader, label %.loopexit.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph113.split.us
  br label %.lr.ph.us.us

.loopexit.us.loopexit:                            ; preds = %._crit_edge.us.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph113.split.us
  %indvars.iv.next133.us = add nuw nsw i64 %indvars.iv132.us, 1
  %exitcond141.us = icmp eq i64 %indvars.iv.next139.us, 1199
  br i1 %exitcond141.us, label %._crit_edge114.loopexit, label %.lr.ph113.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv134.us.us = phi i64 [ %indvars.iv.next135.us.us, %._crit_edge.us.us ], [ %indvars.iv132.us, %.lr.ph.us.us.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv138.us, i64 %indvars.iv134.us.us
  store double 0.000000e+00, double* %54, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.us.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 false, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ undef, %.prol.loopexit ], [ %68, %._crit_edge.us.us.loopexit ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv134.us.us, i64 %indvars.iv138.us
  store double %.lcssa, double* %55, align 8
  %indvars.iv.next135.us.us = add nuw nsw i64 %indvars.iv134.us.us, 1
  %exitcond137.us.us = icmp eq i64 %indvars.iv.next135.us.us, 1200
  br i1 %exitcond137.us.us, label %.loopexit.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %56 = phi double [ %68, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us.new.preheader ]
  %indvars.iv.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new ], [ %indvars.iv.us.us.unr.ph, %.lr.ph.us.us.new.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.us.us, i64 %indvars.iv138.us
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.us.us, i64 %indvars.iv134.us.us
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %56, %61
  store double %62, double* %54, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.us.us, i64 %indvars.iv138.us
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.us.us, i64 %indvars.iv134.us.us
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %62, %67
  store double %68, double* %54, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.us.us.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.loopexit.loopexit:                               ; preds = %.lr.ph111.split
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph111.split.prol.loopexit, %.lr.ph113.split
  br i1 true, label %._crit_edge114.loopexit268, label %.lr.ph113.split

.lr.ph113.split:                                  ; preds = %.lr.ph113.split.preheader, %.loopexit
  br i1 undef, label %.lr.ph111.split.preheader, label %.loopexit

.lr.ph111.split.preheader:                        ; preds = %.lr.ph113.split
  br i1 undef, label %.lr.ph111.split.prol.loopexit, label %.lr.ph111.split.prol.preheader

.lr.ph111.split.prol.preheader:                   ; preds = %.lr.ph111.split.preheader
  br label %.lr.ph111.split.prol

.lr.ph111.split.prol:                             ; preds = %.lr.ph111.split.prol.preheader, %.lr.ph111.split.prol
  br i1 true, label %.lr.ph111.split.prol.loopexit.loopexit, label %.lr.ph111.split.prol, !llvm.loop !5

.lr.ph111.split.prol.loopexit.loopexit:           ; preds = %.lr.ph111.split.prol
  br label %.lr.ph111.split.prol.loopexit

.lr.ph111.split.prol.loopexit:                    ; preds = %.lr.ph111.split.prol.loopexit.loopexit, %.lr.ph111.split.preheader
  br i1 undef, label %.loopexit, label %.lr.ph111.split.preheader223

.lr.ph111.split.preheader223:                     ; preds = %.lr.ph111.split.prol.loopexit
  br label %.lr.ph111.split

.lr.ph111.split:                                  ; preds = %.lr.ph111.split.preheader223, %.lr.ph111.split
  br i1 true, label %.loopexit.loopexit, label %.lr.ph111.split

._crit_edge114.loopexit:                          ; preds = %.loopexit.us
  br label %._crit_edge114

._crit_edge114.loopexit268:                       ; preds = %.loopexit
  br label %._crit_edge114

._crit_edge114:                                   ; preds = %._crit_edge114.loopexit268, %._crit_edge114.loopexit, %.preheader.thread, %.preheader
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %69, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %2
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv16 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next17, %._crit_edge ]
  %7 = mul i64 %indvars.iv16, 1200
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %15 ]
  %9 = add i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %8

._crit_edge:                                      ; preds = %15
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond19, label %._crit_edge15.loopexit, label %.preheader

._crit_edge15.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
