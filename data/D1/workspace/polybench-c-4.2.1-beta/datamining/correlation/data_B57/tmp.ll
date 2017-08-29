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
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
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
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %22, %4
  %indvars.iv8 = phi i64 [ 0, %4 ], [ %indvars.iv.next9, %22 ]
  %5 = trunc i64 %indvars.iv8 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv8
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = fadd <2 x double> %8, %19
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 1400
  br i1 %exitcond, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br i1 true, label %.lr.ph126, label %._crit_edge89

.lr.ph126:                                        ; preds = %7
  br i1 true, label %.lr.ph126.split.us.preheader, label %.lr.ph126.split.preheader

.lr.ph126.split.preheader:                        ; preds = %.lr.ph126
  br i1 undef, label %.lr.ph126.split.prol.loopexit, label %.lr.ph126.split.prol.preheader

.lr.ph126.split.prol.preheader:                   ; preds = %.lr.ph126.split.preheader
  br label %.lr.ph126.split.prol

.lr.ph126.split.prol:                             ; preds = %.lr.ph126.split.prol.preheader, %.lr.ph126.split.prol
  br i1 true, label %.lr.ph126.split.prol.loopexit.loopexit, label %.lr.ph126.split.prol, !llvm.loop !1

.lr.ph126.split.prol.loopexit.loopexit:           ; preds = %.lr.ph126.split.prol
  br label %.lr.ph126.split.prol.loopexit

.lr.ph126.split.prol.loopexit:                    ; preds = %.lr.ph126.split.prol.loopexit.loopexit, %.lr.ph126.split.preheader
  br i1 undef, label %.lr.ph119, label %.lr.ph126.split.preheader206

.lr.ph126.split.preheader206:                     ; preds = %.lr.ph126.split.prol.loopexit
  br i1 undef, label %.lr.ph126.split.preheader225, label %min.iters.checked

.lr.ph126.split.preheader225:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph126.split.preheader206
  br label %.lr.ph126.split

min.iters.checked:                                ; preds = %.lr.ph126.split.preheader206
  br i1 undef, label %.lr.ph126.split.preheader225, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  br i1 true, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  br i1 undef, label %._crit_edge, label %.lr.ph126.split.preheader225

.lr.ph126.split.us.preheader:                     ; preds = %.lr.ph126
  br label %.lr.ph126.split.us

.lr.ph126.split.us:                               ; preds = %._crit_edge123.us, %.lr.ph126.split.us.preheader
  %indvars.iv190 = phi i64 [ 0, %.lr.ph126.split.us.preheader ], [ %indvars.iv.next191, %._crit_edge123.us ]
  %8 = getelementptr inbounds double, double* %5, i64 %indvars.iv190
  store double 0.000000e+00, double* %8, align 8
  br i1 true, label %.prol.loopexit186, label %.prol.preheader185.preheader

.prol.preheader185.preheader:                     ; preds = %.lr.ph126.split.us
  br label %.prol.preheader185

.prol.preheader185:                               ; preds = %.prol.preheader185.preheader, %.prol.preheader185
  br i1 true, label %.prol.loopexit186.loopexit, label %.prol.preheader185, !llvm.loop !6

.prol.loopexit186.loopexit:                       ; preds = %.prol.preheader185
  br label %.prol.loopexit186

.prol.loopexit186:                                ; preds = %.prol.loopexit186.loopexit, %.lr.ph126.split.us
  br i1 false, label %._crit_edge123.us, label %.lr.ph126.split.us.new.preheader

.lr.ph126.split.us.new.preheader:                 ; preds = %.prol.loopexit186
  br label %.lr.ph126.split.us.new

.lr.ph126.split.us.new:                           ; preds = %.lr.ph126.split.us.new.preheader, %.lr.ph126.split.us.new
  %9 = phi double [ %21, %.lr.ph126.split.us.new ], [ 0.000000e+00, %.lr.ph126.split.us.new.preheader ]
  %indvars.iv181 = phi i64 [ %indvars.iv.next182.3, %.lr.ph126.split.us.new ], [ 0, %.lr.ph126.split.us.new.preheader ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv181, i64 %indvars.iv190
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %8, align 8
  %indvars.iv.next182 = or i64 %indvars.iv181, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next182, i64 %indvars.iv190
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %8, align 8
  %indvars.iv.next182.1 = or i64 %indvars.iv181, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next182.1, i64 %indvars.iv190
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %8, align 8
  %indvars.iv.next182.2 = or i64 %indvars.iv181, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next182.2, i64 %indvars.iv190
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %8, align 8
  %indvars.iv.next182.3 = add nsw i64 %indvars.iv181, 4
  %exitcond184.3 = icmp eq i64 %indvars.iv.next182.3, 1400
  br i1 %exitcond184.3, label %._crit_edge123.us.loopexit, label %.lr.ph126.split.us.new

._crit_edge123.us.loopexit:                       ; preds = %.lr.ph126.split.us.new
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %._crit_edge123.us.loopexit, %.prol.loopexit186
  %22 = phi double [ 0.000000e+00, %.prol.loopexit186 ], [ %21, %._crit_edge123.us.loopexit ]
  %23 = fdiv double %22, %2
  store double %23, double* %8, align 8
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv190, 1
  %exitcond193 = icmp eq i64 %indvars.iv.next191, 1200
  br i1 %exitcond193, label %._crit_edge.loopexit, label %.lr.ph126.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge123.us
  br label %._crit_edge

._crit_edge.loopexit226:                          ; preds = %.lr.ph126.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit226, %._crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph119, label %._crit_edge.._crit_edge89_crit_edge

._crit_edge.._crit_edge89_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge89

.lr.ph119:                                        ; preds = %.lr.ph126.split.prol.loopexit, %._crit_edge
  br i1 true, label %.lr.ph119.split.us.preheader, label %.lr.ph119.split.preheader

.lr.ph119.split.us.preheader:                     ; preds = %.lr.ph119
  br label %.lr.ph119.split.us

.lr.ph119.split.preheader:                        ; preds = %.lr.ph119
  br label %.lr.ph119.split.prol.loopexit

.lr.ph119.split.prol:                             ; No predecessors!
  br label %.lr.ph119.split.prol.loopexit

.lr.ph119.split.prol.loopexit:                    ; preds = %.lr.ph119.split.preheader, %.lr.ph119.split.prol
  br i1 undef, label %._crit_edge89, label %.lr.ph119.split.preheader204

.lr.ph119.split.preheader204:                     ; preds = %.lr.ph119.split.prol.loopexit
  br label %.lr.ph119.split

.lr.ph119.split.us:                               ; preds = %.lr.ph119.split.us.preheader, %._crit_edge117.us
  %indvars.iv171 = phi i64 [ %indvars.iv.next172, %._crit_edge117.us ], [ 0, %.lr.ph119.split.us.preheader ]
  %24 = getelementptr inbounds double, double* %6, i64 %indvars.iv171
  store double 0.000000e+00, double* %24, align 8
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv171
  br i1 true, label %.prol.loopexit168, label %.prol.preheader167

.prol.preheader167:                               ; preds = %.lr.ph119.split.us
  br label %.prol.loopexit168

.prol.loopexit168:                                ; preds = %.prol.preheader167, %.lr.ph119.split.us
  %indvars.iv163.unr.ph = phi i64 [ 1, %.prol.preheader167 ], [ 0, %.lr.ph119.split.us ]
  br i1 false, label %._crit_edge117.us, label %.lr.ph119.split.us.new.preheader

.lr.ph119.split.us.new.preheader:                 ; preds = %.prol.loopexit168
  br label %.lr.ph119.split.us.new

.lr.ph119.split.us.new:                           ; preds = %.lr.ph119.split.us.new.preheader, %.lr.ph119.split.us.new
  %26 = phi double [ %38, %.lr.ph119.split.us.new ], [ 0.000000e+00, %.lr.ph119.split.us.new.preheader ]
  %indvars.iv163 = phi i64 [ %indvars.iv.next164.1, %.lr.ph119.split.us.new ], [ %indvars.iv163.unr.ph, %.lr.ph119.split.us.new.preheader ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv163, i64 %indvars.iv171
  %28 = load double, double* %27, align 8
  %29 = load double, double* %25, align 8
  %30 = fsub double %28, %29
  %31 = fmul double %30, %30
  %32 = fadd double %26, %31
  store double %32, double* %24, align 8
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next164, i64 %indvars.iv171
  %34 = load double, double* %33, align 8
  %35 = load double, double* %25, align 8
  %36 = fsub double %34, %35
  %37 = fmul double %36, %36
  %38 = fadd double %32, %37
  store double %38, double* %24, align 8
  %indvars.iv.next164.1 = add nsw i64 %indvars.iv163, 2
  %exitcond166.1 = icmp eq i64 %indvars.iv.next164.1, 1400
  br i1 %exitcond166.1, label %._crit_edge117.us.loopexit, label %.lr.ph119.split.us.new

._crit_edge117.us.loopexit:                       ; preds = %.lr.ph119.split.us.new
  br label %._crit_edge117.us

._crit_edge117.us:                                ; preds = %._crit_edge117.us.loopexit, %.prol.loopexit168
  %39 = phi double [ 0.000000e+00, %.prol.loopexit168 ], [ %38, %._crit_edge117.us.loopexit ]
  %40 = fdiv double %39, %2
  store double %40, double* %24, align 8
  %41 = tail call double @sqrt(double %40) #4
  %42 = fcmp ugt double %41, 1.000000e-01
  %43 = select i1 %42, double %41, double 1.000000e+00
  store double %43, double* %24, align 8
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond174 = icmp eq i64 %indvars.iv.next172, 1200
  br i1 %exitcond174, label %._crit_edge89.loopexit, label %.lr.ph119.split.us

.lr.ph126.split:                                  ; preds = %.lr.ph126.split.preheader225, %.lr.ph126.split
  br i1 true, label %._crit_edge.loopexit226, label %.lr.ph126.split, !llvm.loop !7

._crit_edge89.loopexit:                           ; preds = %._crit_edge117.us
  br label %._crit_edge89

._crit_edge89.loopexit224:                        ; preds = %.lr.ph119.split
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge89.loopexit224, %._crit_edge89.loopexit, %._crit_edge.._crit_edge89_crit_edge, %7, %.lr.ph119.split.prol.loopexit
  br i1 true, label %._crit_edge90.lr.ph, label %._crit_edge91

._crit_edge90.lr.ph:                              ; preds = %._crit_edge89
  br i1 true, label %._crit_edge90.us.preheader, label %._crit_edge91.thread

._crit_edge90.us.preheader:                       ; preds = %._crit_edge90.lr.ph
  br label %._crit_edge90.us

._crit_edge91.thread:                             ; preds = %._crit_edge90.lr.ph
  br label %._crit_edge102

._crit_edge90.us:                                 ; preds = %._crit_edge90.us.preheader, %._crit_edge112.us
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %._crit_edge112.us ], [ 0, %._crit_edge90.us.preheader ]
  br label %44

; <label>:44:                                     ; preds = %44, %._crit_edge90.us
  %indvars.iv154 = phi i64 [ 0, %._crit_edge90.us ], [ %indvars.iv.next155, %44 ]
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv154
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv158, i64 %indvars.iv154
  %48 = load double, double* %47, align 8
  %49 = fsub double %48, %46
  store double %49, double* %47, align 8
  %50 = tail call double @sqrt(double %2) #4
  %51 = getelementptr inbounds double, double* %6, i64 %indvars.iv154
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = load double, double* %47, align 8
  %55 = fdiv double %54, %53
  store double %55, double* %47, align 8
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond157 = icmp eq i64 %indvars.iv.next155, 1200
  br i1 %exitcond157, label %._crit_edge112.us, label %44

._crit_edge112.us:                                ; preds = %44
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next159, 1400
  br i1 %exitcond161, label %._crit_edge91.loopexit, label %._crit_edge90.us

.lr.ph119.split:                                  ; preds = %.lr.ph119.split.preheader204, %.lr.ph119.split
  br i1 true, label %._crit_edge89.loopexit224, label %.lr.ph119.split

._crit_edge91.loopexit:                           ; preds = %._crit_edge112.us
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %._crit_edge91.loopexit, %._crit_edge89
  br i1 true, label %.lr.ph101, label %._crit_edge102

.lr.ph101:                                        ; preds = %._crit_edge91
  br i1 true, label %.lr.ph101.split.us.preheader, label %.lr.ph101.split.preheader

.lr.ph101.split.preheader:                        ; preds = %.lr.ph101
  br label %.lr.ph101.split

.lr.ph101.split.us.preheader:                     ; preds = %.lr.ph101
  br label %.lr.ph101.split.us

.lr.ph101.split.us:                               ; preds = %._crit_edge99.us-lcssa.us.us, %.lr.ph101.split.us.preheader
  %indvars.iv137 = phi i64 [ 0, %.lr.ph101.split.us.preheader ], [ %indvars.iv.next138, %._crit_edge99.us-lcssa.us.us ]
  %indvars.iv131 = phi i64 [ 1, %.lr.ph101.split.us.preheader ], [ %indvars.iv.next132, %._crit_edge99.us-lcssa.us.us ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %56, align 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %57 = icmp slt i64 %indvars.iv.next138, 1200
  br i1 %57, label %.lr.ph.us.us.preheader, label %._crit_edge99.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph101.split.us
  br label %.lr.ph.us.us

._crit_edge99.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge94.us.us
  br label %._crit_edge99.us-lcssa.us.us

._crit_edge99.us-lcssa.us.us:                     ; preds = %._crit_edge99.us-lcssa.us.us.loopexit, %.lr.ph101.split.us
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next138, 1199
  br i1 %exitcond140, label %._crit_edge102.loopexit, label %.lr.ph101.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge94.us.us
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge94.us.us ], [ %indvars.iv131, %.lr.ph.us.us.preheader ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv137, i64 %indvars.iv133
  store double 0.000000e+00, double* %58, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 false, label %._crit_edge94.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge94.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %59 = bitcast double %75 to i64
  br label %._crit_edge94.us.us

._crit_edge94.us.us:                              ; preds = %._crit_edge94.us.us.loopexit, %.prol.loopexit
  %60 = phi i64 [ 0, %.prol.loopexit ], [ %59, %._crit_edge94.us.us.loopexit ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv133, i64 %indvars.iv137
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond = icmp eq i64 %indvars.iv.next134, 1200
  br i1 %exitcond, label %._crit_edge99.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %63 = phi double [ %75, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv137
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv133
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %58, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv137
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv133
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %69, %74
  store double %75, double* %58, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge94.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph101.split:                                  ; preds = %._crit_edge99, %.lr.ph101.split.preheader
  br i1 undef, label %.lr.ph98.split.preheader, label %._crit_edge99

.lr.ph98.split.preheader:                         ; preds = %.lr.ph101.split
  br i1 undef, label %.lr.ph98.split.prol.loopexit, label %.lr.ph98.split.prol.preheader

.lr.ph98.split.prol.preheader:                    ; preds = %.lr.ph98.split.preheader
  br label %.lr.ph98.split.prol

.lr.ph98.split.prol:                              ; preds = %.lr.ph98.split.prol.preheader, %.lr.ph98.split.prol
  br i1 true, label %.lr.ph98.split.prol.loopexit.loopexit, label %.lr.ph98.split.prol, !llvm.loop !9

.lr.ph98.split.prol.loopexit.loopexit:            ; preds = %.lr.ph98.split.prol
  br label %.lr.ph98.split.prol.loopexit

.lr.ph98.split.prol.loopexit:                     ; preds = %.lr.ph98.split.prol.loopexit.loopexit, %.lr.ph98.split.preheader
  br i1 undef, label %._crit_edge99, label %.lr.ph98.split.preheader222

.lr.ph98.split.preheader222:                      ; preds = %.lr.ph98.split.prol.loopexit
  br label %.lr.ph98.split

.lr.ph98.split:                                   ; preds = %.lr.ph98.split.preheader222, %.lr.ph98.split
  br i1 true, label %._crit_edge99.loopexit, label %.lr.ph98.split

._crit_edge99.loopexit:                           ; preds = %.lr.ph98.split
  br label %._crit_edge99

._crit_edge99:                                    ; preds = %._crit_edge99.loopexit, %.lr.ph98.split.prol.loopexit, %.lr.ph101.split
  br i1 true, label %._crit_edge102.loopexit223, label %.lr.ph101.split

._crit_edge102.loopexit:                          ; preds = %._crit_edge99.us-lcssa.us.us
  br label %._crit_edge102

._crit_edge102.loopexit223:                       ; preds = %._crit_edge99
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102.loopexit223, %._crit_edge102.loopexit, %._crit_edge91.thread, %._crit_edge91
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %76, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge13

._crit_edge.us.preheader:                         ; preds = %2
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge11.us, %._crit_edge.us.preheader
  %indvars.iv14 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next15, %._crit_edge11.us ]
  %7 = mul nsw i64 %indvars.iv14, 1200
  br label %8

; <label>:8:                                      ; preds = %._crit_edge9.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge9.us ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge9.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge11.us, label %8

._crit_edge11.us:                                 ; preds = %._crit_edge9.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %._crit_edge.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !2}
