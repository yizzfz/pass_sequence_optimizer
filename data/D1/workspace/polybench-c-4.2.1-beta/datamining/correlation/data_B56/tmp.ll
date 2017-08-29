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
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge14

.._crit_edge_crit_edge14:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge14, %.._crit_edge_crit_edge, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %2
  %indvars.iv7 = phi i64 [ 0, %2 ], [ %indvars.iv.next8, %.._crit_edge_crit_edge ]
  %3 = trunc i64 %indvars.iv7 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %._crit_edge1, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge1 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv7
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv7
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %._crit_edge1

._crit_edge1:                                     ; preds = %7
  br label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1400
  br i1 %exitcond, label %21, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %20
  br label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph124.split.us.preheader:
  %sunkaddr206 = ptrtoint double* %5 to i64
  br label %.lr.ph124.split.us

.lr.ph124.split.us:                               ; preds = %._crit_edge121.us..lr.ph124.split.us_crit_edge, %.lr.ph124.split.us.preheader
  %indvars.iv187 = phi i64 [ 0, %.lr.ph124.split.us.preheader ], [ %indvars.iv.next188, %._crit_edge121.us..lr.ph124.split.us_crit_edge ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv187
  store double 0.000000e+00, double* %7, align 8
  %sunkaddr207 = shl i64 %indvars.iv187, 3
  %sunkaddr208 = add i64 %sunkaddr206, %sunkaddr207
  %sunkaddr209 = inttoptr i64 %sunkaddr208 to double*
  br label %.lr.ph124.split.us.new

.lr.ph124.split.us.new:                           ; preds = %.lr.ph124.split.us.new..lr.ph124.split.us.new_crit_edge, %.lr.ph124.split.us
  %indvars.iv179 = phi i64 [ %indvars.iv.next180.3, %.lr.ph124.split.us.new..lr.ph124.split.us.new_crit_edge ], [ 0, %.lr.ph124.split.us ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv179, i64 %indvars.iv187
  %9 = load double, double* %8, align 8
  %10 = load double, double* %sunkaddr209, align 8
  %11 = fadd double %9, %10
  store double %11, double* %sunkaddr209, align 8
  %indvars.iv.next180 = or i64 %indvars.iv179, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next180, i64 %indvars.iv187
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr209, align 8
  %indvars.iv.next180.1 = or i64 %indvars.iv179, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next180.1, i64 %indvars.iv187
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr209, align 8
  %indvars.iv.next180.2 = or i64 %indvars.iv179, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next180.2, i64 %indvars.iv187
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %sunkaddr209, align 8
  %indvars.iv.next180.3 = add nsw i64 %indvars.iv179, 4
  %exitcond182.3 = icmp eq i64 %indvars.iv.next180.3, 1400
  br i1 %exitcond182.3, label %._crit_edge121.us, label %.lr.ph124.split.us.new..lr.ph124.split.us.new_crit_edge

.lr.ph124.split.us.new..lr.ph124.split.us.new_crit_edge: ; preds = %.lr.ph124.split.us.new
  br label %.lr.ph124.split.us.new

._crit_edge121.us:                                ; preds = %.lr.ph124.split.us.new
  %21 = load double, double* %7, align 8
  %22 = fdiv double %21, %2
  store double %22, double* %7, align 8
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  %exitcond190 = icmp eq i64 %indvars.iv.next188, 1200
  br i1 %exitcond190, label %.lr.ph117.split.us.new.preheader.preheader, label %._crit_edge121.us..lr.ph124.split.us_crit_edge

._crit_edge121.us..lr.ph124.split.us_crit_edge:   ; preds = %._crit_edge121.us
  br label %.lr.ph124.split.us

.lr.ph117.split.us.new.preheader.preheader:       ; preds = %._crit_edge121.us
  %sunkaddr222 = ptrtoint double* %6 to i64
  br label %.lr.ph117.split.us.new.preheader

.lr.ph117.split.us.new.preheader:                 ; preds = %._crit_edge87.us..lr.ph117.split.us.new.preheader_crit_edge, %.lr.ph117.split.us.new.preheader.preheader
  %indvars.iv171 = phi i64 [ %indvars.iv.next172, %._crit_edge87.us..lr.ph117.split.us.new.preheader_crit_edge ], [ 0, %.lr.ph117.split.us.new.preheader.preheader ]
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv171
  store double 0.000000e+00, double* %23, align 8
  %sunkaddr219 = shl i64 %indvars.iv171, 3
  %sunkaddr220 = add i64 %sunkaddr206, %sunkaddr219
  %sunkaddr221 = inttoptr i64 %sunkaddr220 to double*
  %sunkaddr224 = add i64 %sunkaddr222, %sunkaddr219
  %sunkaddr225 = inttoptr i64 %sunkaddr224 to double*
  br label %.lr.ph117.split.us.new

; <label>:24:                                     ; preds = %._crit_edge115.us
  br label %._crit_edge87.us

._crit_edge87.us:                                 ; preds = %._crit_edge115.us.._crit_edge87.us_crit_edge, %24
  %25 = phi double [ %41, %24 ], [ 1.000000e+00, %._crit_edge115.us.._crit_edge87.us_crit_edge ]
  store double %25, double* %23, align 8
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond174 = icmp eq i64 %indvars.iv.next172, 1200
  br i1 %exitcond174, label %._crit_edge88.us.preheader, label %._crit_edge87.us..lr.ph117.split.us.new.preheader_crit_edge

._crit_edge87.us..lr.ph117.split.us.new.preheader_crit_edge: ; preds = %._crit_edge87.us
  br label %.lr.ph117.split.us.new.preheader

._crit_edge88.us.preheader:                       ; preds = %._crit_edge87.us
  br label %._crit_edge88.us

.lr.ph117.split.us.new:                           ; preds = %.lr.ph117.split.us.new..lr.ph117.split.us.new_crit_edge, %.lr.ph117.split.us.new.preheader
  %indvars.iv163 = phi i64 [ %indvars.iv.next164.1, %.lr.ph117.split.us.new..lr.ph117.split.us.new_crit_edge ], [ 0, %.lr.ph117.split.us.new.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv163, i64 %indvars.iv171
  %27 = load double, double* %26, align 8
  %28 = load double, double* %sunkaddr221, align 8
  %29 = fsub double %27, %28
  %30 = fmul double %29, %29
  %31 = load double, double* %sunkaddr225, align 8
  %32 = fadd double %31, %30
  store double %32, double* %sunkaddr225, align 8
  %indvars.iv.next164 = or i64 %indvars.iv163, 1
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next164, i64 %indvars.iv171
  %34 = load double, double* %33, align 8
  %35 = load double, double* %sunkaddr221, align 8
  %36 = fsub double %34, %35
  %37 = fmul double %36, %36
  %38 = fadd double %32, %37
  store double %38, double* %sunkaddr225, align 8
  %indvars.iv.next164.1 = add nsw i64 %indvars.iv163, 2
  %exitcond166.1 = icmp eq i64 %indvars.iv.next164.1, 1400
  br i1 %exitcond166.1, label %._crit_edge115.us, label %.lr.ph117.split.us.new..lr.ph117.split.us.new_crit_edge

.lr.ph117.split.us.new..lr.ph117.split.us.new_crit_edge: ; preds = %.lr.ph117.split.us.new
  br label %.lr.ph117.split.us.new

._crit_edge115.us:                                ; preds = %.lr.ph117.split.us.new
  %39 = load double, double* %23, align 8
  %40 = fdiv double %39, %2
  store double %40, double* %23, align 8
  %41 = tail call double @sqrt(double %40) #4
  store double %41, double* %23, align 8
  %42 = fcmp ugt double %41, 1.000000e-01
  br i1 %42, label %24, label %._crit_edge115.us.._crit_edge87.us_crit_edge

._crit_edge115.us.._crit_edge87.us_crit_edge:     ; preds = %._crit_edge115.us
  br label %._crit_edge87.us

._crit_edge88.us:                                 ; preds = %._crit_edge110.us.._crit_edge88.us_crit_edge, %._crit_edge88.us.preheader
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %._crit_edge110.us.._crit_edge88.us_crit_edge ], [ 0, %._crit_edge88.us.preheader ]
  br label %43

; <label>:43:                                     ; preds = %._crit_edge, %._crit_edge88.us
  %indvars.iv154 = phi i64 [ 0, %._crit_edge88.us ], [ %indvars.iv.next155, %._crit_edge ]
  %44 = getelementptr inbounds double, double* %5, i64 %indvars.iv154
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv158, i64 %indvars.iv154
  %47 = load double, double* %46, align 8
  %48 = fsub double %47, %45
  store double %48, double* %46, align 8
  %49 = tail call double @sqrt(double %2) #4
  %50 = getelementptr inbounds double, double* %6, i64 %indvars.iv154
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = load double, double* %46, align 8
  %54 = fdiv double %53, %52
  store double %54, double* %46, align 8
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond157 = icmp eq i64 %indvars.iv.next155, 1200
  br i1 %exitcond157, label %._crit_edge110.us, label %._crit_edge

._crit_edge:                                      ; preds = %43
  br label %43

._crit_edge110.us:                                ; preds = %43
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next159, 1400
  br i1 %exitcond161, label %.lr.ph99.split.us.preheader, label %._crit_edge110.us.._crit_edge88.us_crit_edge

._crit_edge110.us.._crit_edge88.us_crit_edge:     ; preds = %._crit_edge110.us
  br label %._crit_edge88.us

.lr.ph99.split.us.preheader:                      ; preds = %._crit_edge110.us
  br label %.lr.ph99.split.us

.lr.ph99.split.us:                                ; preds = %._crit_edge97.us-lcssa.us.us..lr.ph99.split.us_crit_edge, %.lr.ph99.split.us.preheader
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge97.us-lcssa.us.us..lr.ph99.split.us_crit_edge ], [ 0, %.lr.ph99.split.us.preheader ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge97.us-lcssa.us.us..lr.ph99.split.us_crit_edge ], [ 1, %.lr.ph99.split.us.preheader ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv135, i64 %indvars.iv135
  store double 1.000000e+00, double* %55, align 8
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %56 = icmp slt i64 %indvars.iv.next136, 1200
  br i1 %56, label %.lr.ph.us.us.new.preheader.preheader, label %.lr.ph99.split.us.._crit_edge97.us-lcssa.us.us_crit_edge

.lr.ph99.split.us.._crit_edge97.us-lcssa.us.us_crit_edge: ; preds = %.lr.ph99.split.us
  br label %._crit_edge97.us-lcssa.us.us

.lr.ph.us.us.new.preheader.preheader:             ; preds = %.lr.ph99.split.us
  br label %.lr.ph.us.us.new.preheader

._crit_edge97.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge92.us.us
  br label %._crit_edge97.us-lcssa.us.us

._crit_edge97.us-lcssa.us.us:                     ; preds = %.lr.ph99.split.us.._crit_edge97.us-lcssa.us.us_crit_edge, %._crit_edge97.us-lcssa.us.us.loopexit
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next136, 1199
  br i1 %exitcond138, label %._crit_edge100, label %._crit_edge97.us-lcssa.us.us..lr.ph99.split.us_crit_edge

._crit_edge97.us-lcssa.us.us..lr.ph99.split.us_crit_edge: ; preds = %._crit_edge97.us-lcssa.us.us
  br label %.lr.ph99.split.us

.lr.ph.us.us.new.preheader:                       ; preds = %._crit_edge92.us.us..lr.ph.us.us.new.preheader_crit_edge, %.lr.ph.us.us.new.preheader.preheader
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %._crit_edge92.us.us..lr.ph.us.us.new.preheader_crit_edge ], [ %indvars.iv129, %.lr.ph.us.us.new.preheader.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv135, i64 %indvars.iv131
  store double 0.000000e+00, double* %57, align 8
  br label %.lr.ph.us.us.new

._crit_edge92.us.us:                              ; preds = %.lr.ph.us.us.new
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv131, i64 %indvars.iv135
  store double %71, double* %58, align 8
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond = icmp eq i64 %indvars.iv.next132, 1200
  br i1 %exitcond, label %._crit_edge97.us-lcssa.us.us.loopexit, label %._crit_edge92.us.us..lr.ph.us.us.new.preheader_crit_edge

._crit_edge92.us.us..lr.ph.us.us.new.preheader_crit_edge: ; preds = %._crit_edge92.us.us
  br label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %59 = phi double [ %71, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ 0, %.lr.ph.us.us.new.preheader ]
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv135
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv131
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  store double %65, double* %57, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv135
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv131
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %57, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge92.us.us, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

._crit_edge100:                                   ; preds = %._crit_edge97.us-lcssa.us.us
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %72, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge10.us.._crit_edge.us_crit_edge, %._crit_edge.us.preheader
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next14, %._crit_edge10.us.._crit_edge.us_crit_edge ]
  %6 = mul nsw i64 %indvars.iv13, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge8.us._crit_edge, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge8.us._crit_edge ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.._crit_edge8.us_crit_edge

.._crit_edge8.us_crit_edge:                       ; preds = %7
  br label %._crit_edge8.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %.._crit_edge8.us_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge10.us, label %._crit_edge8.us._crit_edge

._crit_edge8.us._crit_edge:                       ; preds = %._crit_edge8.us
  br label %7

._crit_edge10.us:                                 ; preds = %._crit_edge8.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond16, label %._crit_edge12, label %._crit_edge10.us.._crit_edge.us_crit_edge

._crit_edge10.us.._crit_edge.us_crit_edge:        ; preds = %._crit_edge10.us
  br label %._crit_edge.us

._crit_edge12:                                    ; preds = %._crit_edge10.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
