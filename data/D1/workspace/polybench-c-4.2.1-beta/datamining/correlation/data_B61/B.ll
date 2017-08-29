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
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %17, %2
  %storemerge8 = phi i32 [ 0, %2 ], [ %18, %17 ]
  %3 = sitofp i32 %storemerge8 to double
  %4 = sext i32 %storemerge8 to i64
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.200000e+03
  %9 = fadd double %3, %8
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %4, i64 %indvars.iv
  store double %9, double* %10, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %4
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.200000e+03
  %15 = fadd double %3, %14
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %4, i64 %indvars.iv.next
  store double %15, double* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %18 = add nsw i32 %storemerge8, 1
  %19 = icmp slt i32 %18, 1400
  br i1 %19, label %.._crit_edge_crit_edge, label %20

; <label>:20:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph135, label %._crit_edge.._crit_edge90_crit_edge

.lr.ph135:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph135.split.us.preheader, label %.lr.ph135.split.preheader

.lr.ph135.split.preheader:                        ; preds = %.lr.ph135
  %10 = fdiv double 0.000000e+00, %2
  %wide.trip.count196 = zext i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  br i1 %min.iters.check, label %.lr.ph135.split.preheader217, label %min.iters.checked

.lr.ph135.split.preheader217:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph135.split.preheader
  %indvars.iv194.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph135.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph135.split

min.iters.checked:                                ; preds = %.lr.ph135.split.preheader
  %11 = and i32 %0, 3
  %n.mod.vf = zext i32 %11 to i64
  %n.vec = sub nsw i64 %wide.trip.count196, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph135.split.preheader217, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert213 = insertelement <2 x double> undef, double %10, i32 0
  %broadcast.splat214 = shufflevector <2 x double> %broadcast.splatinsert213, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %12 = getelementptr inbounds double, double* %5, i64 %index
  %13 = bitcast double* %12 to <2 x double>*
  store <2 x double> %broadcast.splat214, <2 x double>* %13, align 8
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> %broadcast.splat214, <2 x double>* %15, align 8
  %index.next = add i64 %index, 4
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i32 %11, 0
  br i1 %cmp.n, label %.lr.ph129, label %.lr.ph135.split.preheader217

.lr.ph135.split.us.preheader:                     ; preds = %.lr.ph135
  %sunkaddr = ptrtoint double* %5 to i64
  %wide.trip.count192 = zext i32 %1 to i64
  %17 = add nsw i64 %wide.trip.count192, -1
  %xtraiter229 = and i64 %wide.trip.count192, 3
  %lcmp.mod230 = icmp eq i64 %xtraiter229, 0
  %18 = icmp ult i64 %17, 3
  br label %.lr.ph135.split.us

.lr.ph135.split.us:                               ; preds = %.lr.ph135.split.us.preheader, %._crit_edge.us
  %storemerge133.us = phi i32 [ %39, %._crit_edge.us ], [ 0, %.lr.ph135.split.us.preheader ]
  %19 = sext i32 %storemerge133.us to i64
  %20 = getelementptr inbounds double, double* %5, i64 %19
  store double 0.000000e+00, double* %20, align 8
  %sunkaddr142 = shl nsw i64 %19, 3
  %sunkaddr143 = add i64 %sunkaddr, %sunkaddr142
  %sunkaddr144 = inttoptr i64 %sunkaddr143 to double*
  br i1 %lcmp.mod230, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph135.split.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol, %._crit_edge.prol.preheader
  %indvars.iv190.prol = phi i64 [ 0, %._crit_edge.prol.preheader ], [ %indvars.iv.next191.prol, %._crit_edge.prol ]
  %21 = phi double [ 0.000000e+00, %._crit_edge.prol.preheader ], [ %24, %._crit_edge.prol ]
  %prol.iter231 = phi i64 [ %xtraiter229, %._crit_edge.prol.preheader ], [ %prol.iter231.sub, %._crit_edge.prol ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv190.prol, i64 %19
  %23 = load double, double* %22, align 8
  %24 = fadd double %23, %21
  store double %24, double* %sunkaddr144, align 8
  %indvars.iv.next191.prol = add nuw nsw i64 %indvars.iv190.prol, 1
  %prol.iter231.sub = add i64 %prol.iter231, -1
  %prol.iter231.cmp = icmp eq i64 %prol.iter231.sub, 0
  br i1 %prol.iter231.cmp, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol, !llvm.loop !4

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %._crit_edge.prol
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %.lr.ph135.split.us, %._crit_edge.prol.loopexit.unr-lcssa
  %.lcssa220.unr = phi double [ undef, %.lr.ph135.split.us ], [ %24, %._crit_edge.prol.loopexit.unr-lcssa ]
  %indvars.iv190.unr = phi i64 [ 0, %.lr.ph135.split.us ], [ %indvars.iv.next191.prol, %._crit_edge.prol.loopexit.unr-lcssa ]
  %.unr232 = phi double [ 0.000000e+00, %.lr.ph135.split.us ], [ %24, %._crit_edge.prol.loopexit.unr-lcssa ]
  br i1 %18, label %._crit_edge.us, label %.lr.ph135.split.us.new

.lr.ph135.split.us.new:                           ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph135.split.us.new
  %indvars.iv190 = phi i64 [ %indvars.iv190.unr, %.lr.ph135.split.us.new ], [ %indvars.iv.next191.3, %._crit_edge ]
  %25 = phi double [ %.unr232, %.lr.ph135.split.us.new ], [ %37, %._crit_edge ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv190, i64 %19
  %27 = load double, double* %26, align 8
  %28 = fadd double %27, %25
  store double %28, double* %sunkaddr144, align 8
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv190, 1
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next191, i64 %19
  %30 = load double, double* %29, align 8
  %31 = fadd double %30, %28
  store double %31, double* %sunkaddr144, align 8
  %indvars.iv.next191.1 = add nsw i64 %indvars.iv190, 2
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next191.1, i64 %19
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %sunkaddr144, align 8
  %indvars.iv.next191.2 = add nsw i64 %indvars.iv190, 3
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next191.2, i64 %19
  %36 = load double, double* %35, align 8
  %37 = fadd double %36, %34
  store double %37, double* %sunkaddr144, align 8
  %indvars.iv.next191.3 = add nsw i64 %indvars.iv190, 4
  %exitcond193.3 = icmp eq i64 %indvars.iv.next191.3, %wide.trip.count192
  br i1 %exitcond193.3, label %._crit_edge.us.unr-lcssa, label %._crit_edge

._crit_edge.us.unr-lcssa:                         ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.prol.loopexit, %._crit_edge.us.unr-lcssa
  %.lcssa220 = phi double [ %.lcssa220.unr, %._crit_edge.prol.loopexit ], [ %37, %._crit_edge.us.unr-lcssa ]
  %38 = fdiv double %.lcssa220, %2
  store double %38, double* %sunkaddr144, align 8
  %39 = add nsw i32 %storemerge133.us, 1
  %40 = icmp slt i32 %39, %0
  br i1 %40, label %.lr.ph135.split.us, label %.lr.ph129.loopexit

.lr.ph129.loopexit:                               ; preds = %._crit_edge.us
  br label %.lr.ph129

.lr.ph129.loopexit218:                            ; preds = %.lr.ph135.split
  br label %.lr.ph129

.lr.ph129:                                        ; preds = %.lr.ph129.loopexit218, %.lr.ph129.loopexit, %middle.block
  br i1 %9, label %.lr.ph129.split.us.preheader, label %.lr.ph129.split.preheader

.lr.ph129.split.preheader:                        ; preds = %.lr.ph129
  %41 = fdiv double 0.000000e+00, %2
  %wide.trip.count188 = zext i32 %0 to i64
  %42 = add nsw i64 %wide.trip.count188, -1
  %xtraiter226 = and i64 %wide.trip.count188, 3
  %lcmp.mod227 = icmp eq i64 %xtraiter226, 0
  br i1 %lcmp.mod227, label %.lr.ph129.split.prol.loopexit, label %.lr.ph129.split.prol.preheader

.lr.ph129.split.prol.preheader:                   ; preds = %.lr.ph129.split.preheader
  br label %.lr.ph129.split.prol

.lr.ph129.split.prol:                             ; preds = %.lr.ph129.split.prol, %.lr.ph129.split.prol.preheader
  %indvars.iv186.prol = phi i64 [ %indvars.iv.next187.prol, %.lr.ph129.split.prol ], [ 0, %.lr.ph129.split.prol.preheader ]
  %prol.iter228 = phi i64 [ %prol.iter228.sub, %.lr.ph129.split.prol ], [ %xtraiter226, %.lr.ph129.split.prol.preheader ]
  %43 = getelementptr inbounds double, double* %6, i64 %indvars.iv186.prol
  store double %41, double* %43, align 8
  %44 = tail call double @sqrt(double %41) #4
  %45 = fcmp ugt double %44, 1.000000e-01
  %46 = select i1 %45, double %44, double 1.000000e+00
  store double %46, double* %43, align 8
  %indvars.iv.next187.prol = add nuw nsw i64 %indvars.iv186.prol, 1
  %prol.iter228.sub = add i64 %prol.iter228, -1
  %prol.iter228.cmp = icmp eq i64 %prol.iter228.sub, 0
  br i1 %prol.iter228.cmp, label %.lr.ph129.split.prol.loopexit.unr-lcssa, label %.lr.ph129.split.prol, !llvm.loop !6

.lr.ph129.split.prol.loopexit.unr-lcssa:          ; preds = %.lr.ph129.split.prol
  br label %.lr.ph129.split.prol.loopexit

.lr.ph129.split.prol.loopexit:                    ; preds = %.lr.ph129.split.preheader, %.lr.ph129.split.prol.loopexit.unr-lcssa
  %indvars.iv186.unr = phi i64 [ 0, %.lr.ph129.split.preheader ], [ %indvars.iv.next187.prol, %.lr.ph129.split.prol.loopexit.unr-lcssa ]
  %47 = icmp ult i64 %42, 3
  br i1 %47, label %._crit_edge.._crit_edge90_crit_edge.loopexit216, label %.lr.ph129.split.preheader.new

.lr.ph129.split.preheader.new:                    ; preds = %.lr.ph129.split.prol.loopexit
  br label %.lr.ph129.split

.lr.ph129.split.us.preheader:                     ; preds = %.lr.ph129
  %sunkaddr149 = ptrtoint double* %5 to i64
  %sunkaddr153 = ptrtoint double* %6 to i64
  %wide.trip.count184 = zext i32 %1 to i64
  %xtraiter223 = and i64 %wide.trip.count184, 1
  %lcmp.mod224 = icmp eq i64 %xtraiter223, 0
  %48 = icmp eq i32 %1, 1
  br label %.lr.ph129.split.us

.lr.ph129.split.us:                               ; preds = %.lr.ph129.split.us.preheader, %._crit_edge126.us
  %storemerge1128.us = phi i32 [ %74, %._crit_edge126.us ], [ 0, %.lr.ph129.split.us.preheader ]
  %49 = sext i32 %storemerge1128.us to i64
  %50 = getelementptr inbounds double, double* %6, i64 %49
  store double 0.000000e+00, double* %50, align 8
  %sunkaddr150 = shl nsw i64 %49, 3
  %sunkaddr151 = add i64 %sunkaddr149, %sunkaddr150
  %sunkaddr152 = inttoptr i64 %sunkaddr151 to double*
  %sunkaddr155 = add i64 %sunkaddr153, %sunkaddr150
  %sunkaddr156 = inttoptr i64 %sunkaddr155 to double*
  br i1 %lcmp.mod224, label %._crit_edge198.prol.loopexit.unr-lcssa, label %._crit_edge198.prol.preheader

._crit_edge198.prol.preheader:                    ; preds = %.lr.ph129.split.us
  br label %._crit_edge198.prol

._crit_edge198.prol:                              ; preds = %._crit_edge198.prol.preheader
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %49
  %52 = load double, double* %51, align 8
  %53 = load double, double* %sunkaddr152, align 8
  %54 = fsub double %52, %53
  %55 = fmul double %54, %54
  %56 = fadd double %55, 0.000000e+00
  store double %56, double* %sunkaddr156, align 8
  br label %._crit_edge198.prol.loopexit.unr-lcssa

._crit_edge198.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph129.split.us, %._crit_edge198.prol
  %.lcssa219.unr.ph = phi double [ %56, %._crit_edge198.prol ], [ undef, %.lr.ph129.split.us ]
  %indvars.iv182.unr.ph = phi i64 [ 1, %._crit_edge198.prol ], [ 0, %.lr.ph129.split.us ]
  %.unr225.ph = phi double [ %56, %._crit_edge198.prol ], [ 0.000000e+00, %.lr.ph129.split.us ]
  br label %._crit_edge198.prol.loopexit

._crit_edge198.prol.loopexit:                     ; preds = %._crit_edge198.prol.loopexit.unr-lcssa
  br i1 %48, label %._crit_edge126.us, label %.lr.ph129.split.us.new

.lr.ph129.split.us.new:                           ; preds = %._crit_edge198.prol.loopexit
  br label %._crit_edge198

._crit_edge198:                                   ; preds = %._crit_edge198, %.lr.ph129.split.us.new
  %indvars.iv182 = phi i64 [ %indvars.iv182.unr.ph, %.lr.ph129.split.us.new ], [ %indvars.iv.next183.1, %._crit_edge198 ]
  %57 = phi double [ %.unr225.ph, %.lr.ph129.split.us.new ], [ %69, %._crit_edge198 ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv182, i64 %49
  %59 = load double, double* %58, align 8
  %60 = load double, double* %sunkaddr152, align 8
  %61 = fsub double %59, %60
  %62 = fmul double %61, %61
  %63 = fadd double %57, %62
  store double %63, double* %sunkaddr156, align 8
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183, i64 %49
  %65 = load double, double* %64, align 8
  %66 = load double, double* %sunkaddr152, align 8
  %67 = fsub double %65, %66
  %68 = fmul double %67, %67
  %69 = fadd double %63, %68
  store double %69, double* %sunkaddr156, align 8
  %indvars.iv.next183.1 = add nsw i64 %indvars.iv182, 2
  %exitcond185.1 = icmp eq i64 %indvars.iv.next183.1, %wide.trip.count184
  br i1 %exitcond185.1, label %._crit_edge126.us.unr-lcssa, label %._crit_edge198

._crit_edge126.us.unr-lcssa:                      ; preds = %._crit_edge198
  br label %._crit_edge126.us

._crit_edge126.us:                                ; preds = %._crit_edge198.prol.loopexit, %._crit_edge126.us.unr-lcssa
  %.lcssa219 = phi double [ %.lcssa219.unr.ph, %._crit_edge198.prol.loopexit ], [ %69, %._crit_edge126.us.unr-lcssa ]
  %70 = fdiv double %.lcssa219, %2
  store double %70, double* %sunkaddr156, align 8
  %71 = tail call double @sqrt(double %70) #4
  %72 = fcmp ugt double %71, 1.000000e-01
  %73 = select i1 %72, double %71, double 1.000000e+00
  store double %73, double* %sunkaddr156, align 8
  %74 = add nsw i32 %storemerge1128.us, 1
  %75 = icmp slt i32 %74, %0
  br i1 %75, label %.lr.ph129.split.us, label %._crit_edge.._crit_edge90_crit_edge.loopexit

.lr.ph135.split:                                  ; preds = %.lr.ph135.split.preheader217, %.lr.ph135.split
  %indvars.iv194 = phi i64 [ %indvars.iv.next195, %.lr.ph135.split ], [ %indvars.iv194.ph, %.lr.ph135.split.preheader217 ]
  %76 = getelementptr inbounds double, double* %5, i64 %indvars.iv194
  store double %10, double* %76, align 8
  %indvars.iv.next195 = add nuw nsw i64 %indvars.iv194, 1
  %exitcond197 = icmp eq i64 %indvars.iv.next195, %wide.trip.count196
  br i1 %exitcond197, label %.lr.ph129.loopexit218, label %.lr.ph135.split, !llvm.loop !7

._crit_edge.._crit_edge90_crit_edge.loopexit:     ; preds = %._crit_edge126.us
  br label %._crit_edge.._crit_edge90_crit_edge

._crit_edge.._crit_edge90_crit_edge.loopexit216.unr-lcssa: ; preds = %.lr.ph129.split
  br label %._crit_edge.._crit_edge90_crit_edge.loopexit216

._crit_edge.._crit_edge90_crit_edge.loopexit216:  ; preds = %.lr.ph129.split.prol.loopexit, %._crit_edge.._crit_edge90_crit_edge.loopexit216.unr-lcssa
  br label %._crit_edge.._crit_edge90_crit_edge

._crit_edge.._crit_edge90_crit_edge:              ; preds = %._crit_edge.._crit_edge90_crit_edge.loopexit216, %._crit_edge.._crit_edge90_crit_edge.loopexit, %7
  %77 = icmp sgt i32 %1, 0
  br i1 %77, label %._crit_edge90.._crit_edge92_crit_edge.lr.ph, label %._crit_edge90.._crit_edge93_crit_edge

._crit_edge90.._crit_edge92_crit_edge.lr.ph:      ; preds = %._crit_edge.._crit_edge90_crit_edge
  br i1 %8, label %._crit_edge90.._crit_edge92_crit_edge.us.preheader, label %._crit_edge90.._crit_edge93_crit_edge.thread

._crit_edge90.._crit_edge92_crit_edge.us.preheader: ; preds = %._crit_edge90.._crit_edge92_crit_edge.lr.ph
  %wide.trip.count179 = zext i32 %0 to i64
  br label %._crit_edge90.._crit_edge92_crit_edge.us

._crit_edge90.._crit_edge93_crit_edge.thread:     ; preds = %._crit_edge90.._crit_edge92_crit_edge.lr.ph
  %78 = add nsw i32 %0, -1
  br label %._crit_edge93._crit_edge

._crit_edge90.._crit_edge92_crit_edge.us:         ; preds = %._crit_edge90.._crit_edge92_crit_edge.us.preheader, %._crit_edge92._crit_edge.us
  %storemerge2122.us = phi i32 [ %91, %._crit_edge92._crit_edge.us ], [ 0, %._crit_edge90.._crit_edge92_crit_edge.us.preheader ]
  %79 = sext i32 %storemerge2122.us to i64
  br label %._crit_edge92.us

._crit_edge92.us:                                 ; preds = %._crit_edge92.us, %._crit_edge90.._crit_edge92_crit_edge.us
  %indvars.iv177 = phi i64 [ 0, %._crit_edge90.._crit_edge92_crit_edge.us ], [ %indvars.iv.next178, %._crit_edge92.us ]
  %80 = getelementptr inbounds double, double* %5, i64 %indvars.iv177
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %79, i64 %indvars.iv177
  %83 = load double, double* %82, align 8
  %84 = fsub double %83, %81
  store double %84, double* %82, align 8
  %85 = tail call double @sqrt(double %2) #4
  %86 = getelementptr inbounds double, double* %6, i64 %indvars.iv177
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = load double, double* %82, align 8
  %90 = fdiv double %89, %88
  store double %90, double* %82, align 8
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %exitcond180 = icmp eq i64 %indvars.iv.next178, %wide.trip.count179
  br i1 %exitcond180, label %._crit_edge92._crit_edge.us, label %._crit_edge92.us

._crit_edge92._crit_edge.us:                      ; preds = %._crit_edge92.us
  %91 = add nsw i32 %storemerge2122.us, 1
  %92 = icmp slt i32 %91, %1
  br i1 %92, label %._crit_edge90.._crit_edge92_crit_edge.us, label %._crit_edge90.._crit_edge93_crit_edge.loopexit

.lr.ph129.split:                                  ; preds = %.lr.ph129.split, %.lr.ph129.split.preheader.new
  %indvars.iv186 = phi i64 [ %indvars.iv186.unr, %.lr.ph129.split.preheader.new ], [ %indvars.iv.next187.3, %.lr.ph129.split ]
  %93 = getelementptr inbounds double, double* %6, i64 %indvars.iv186
  store double %41, double* %93, align 8
  %94 = tail call double @sqrt(double %41) #4
  %95 = fcmp ugt double %94, 1.000000e-01
  %96 = select i1 %95, double %94, double 1.000000e+00
  store double %96, double* %93, align 8
  %indvars.iv.next187 = add nuw nsw i64 %indvars.iv186, 1
  %97 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next187
  store double %41, double* %97, align 8
  %98 = tail call double @sqrt(double %41) #4
  %99 = fcmp ugt double %98, 1.000000e-01
  %100 = select i1 %99, double %98, double 1.000000e+00
  store double %100, double* %97, align 8
  %indvars.iv.next187.1 = add nsw i64 %indvars.iv186, 2
  %101 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next187.1
  store double %41, double* %101, align 8
  %102 = tail call double @sqrt(double %41) #4
  %103 = fcmp ugt double %102, 1.000000e-01
  %104 = select i1 %103, double %102, double 1.000000e+00
  store double %104, double* %101, align 8
  %indvars.iv.next187.2 = add nsw i64 %indvars.iv186, 3
  %105 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next187.2
  store double %41, double* %105, align 8
  %106 = tail call double @sqrt(double %41) #4
  %107 = fcmp ugt double %106, 1.000000e-01
  %108 = select i1 %107, double %106, double 1.000000e+00
  store double %108, double* %105, align 8
  %indvars.iv.next187.3 = add nsw i64 %indvars.iv186, 4
  %exitcond189.3 = icmp eq i64 %indvars.iv.next187.3, %wide.trip.count188
  br i1 %exitcond189.3, label %._crit_edge.._crit_edge90_crit_edge.loopexit216.unr-lcssa, label %.lr.ph129.split

._crit_edge90.._crit_edge93_crit_edge.loopexit:   ; preds = %._crit_edge92._crit_edge.us
  br label %._crit_edge90.._crit_edge93_crit_edge

._crit_edge90.._crit_edge93_crit_edge:            ; preds = %._crit_edge90.._crit_edge93_crit_edge.loopexit, %._crit_edge.._crit_edge90_crit_edge
  %109 = add nsw i32 %0, -1
  %110 = icmp sgt i32 %0, 1
  br i1 %110, label %.lr.ph110, label %._crit_edge93._crit_edge

.lr.ph110:                                        ; preds = %._crit_edge90.._crit_edge93_crit_edge
  br i1 %77, label %.lr.ph110.split.us.preheader, label %.lr.ph110.split.preheader

.lr.ph110.split.preheader:                        ; preds = %.lr.ph110
  %wide.trip.count175 = zext i32 %0 to i64
  %111 = add nuw nsw i64 %wide.trip.count175, 3
  %112 = add nsw i64 %wide.trip.count175, -2
  br label %.lr.ph110.split

.lr.ph110.split.us.preheader:                     ; preds = %.lr.ph110
  %wide.trip.count = zext i32 %1 to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %113 = icmp eq i32 %1, 1
  br label %.lr.ph110.split.us

.lr.ph110.split.us:                               ; preds = %.lr.ph110.split.us.preheader, %._crit_edge93.us
  %storemerge3109.us = phi i32 [ %storemerge4104.us, %._crit_edge93.us ], [ 0, %.lr.ph110.split.us.preheader ]
  %114 = sext i32 %storemerge3109.us to i64
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %114, i64 %114
  store double 1.000000e+00, double* %115, align 8
  %storemerge4104.us = add nsw i32 %storemerge3109.us, 1
  %116 = icmp slt i32 %storemerge4104.us, %0
  br i1 %116, label %.lr.ph.us.us.preheader, label %._crit_edge93.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph110.split.us
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %114
  br label %.lr.ph.us.us

._crit_edge93.us.loopexit:                        ; preds = %._crit_edge102.us.us
  br label %._crit_edge93.us

._crit_edge93.us:                                 ; preds = %._crit_edge93.us.loopexit, %.lr.ph110.split.us
  %118 = icmp slt i32 %storemerge4104.us, %109
  br i1 %118, label %.lr.ph110.split.us, label %._crit_edge93._crit_edge.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge102.us.us
  %storemerge4105.us.us = phi i32 [ %storemerge4.us.us, %._crit_edge102.us.us ], [ %storemerge4104.us, %.lr.ph.us.us.preheader ]
  %119 = sext i32 %storemerge4105.us.us to i64
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %114, i64 %119
  store double 0.000000e+00, double* %120, align 8
  br i1 %lcmp.mod, label %._crit_edge199.prol.loopexit.unr-lcssa, label %._crit_edge199.prol.preheader

._crit_edge199.prol.preheader:                    ; preds = %.lr.ph.us.us
  br label %._crit_edge199.prol

._crit_edge199.prol:                              ; preds = %._crit_edge199.prol.preheader
  %121 = load double, double* %117, align 8
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %119
  %123 = load double, double* %122, align 8
  %124 = fmul double %121, %123
  %125 = fadd double %124, 0.000000e+00
  store double %125, double* %120, align 8
  br label %._crit_edge199.prol.loopexit.unr-lcssa

._crit_edge199.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph.us.us, %._crit_edge199.prol
  %.lcssa.unr.ph = phi double [ %125, %._crit_edge199.prol ], [ undef, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge199.prol ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %125, %._crit_edge199.prol ], [ 0.000000e+00, %.lr.ph.us.us ]
  br label %._crit_edge199.prol.loopexit

._crit_edge199.prol.loopexit:                     ; preds = %._crit_edge199.prol.loopexit.unr-lcssa
  br i1 %113, label %._crit_edge102.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %._crit_edge199.prol.loopexit
  br label %._crit_edge199

._crit_edge102.us.us.unr-lcssa:                   ; preds = %._crit_edge199
  br label %._crit_edge102.us.us

._crit_edge102.us.us:                             ; preds = %._crit_edge199.prol.loopexit, %._crit_edge102.us.us.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge199.prol.loopexit ], [ %140, %._crit_edge102.us.us.unr-lcssa ]
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %119, i64 %114
  store double %.lcssa, double* %126, align 8
  %storemerge4.us.us = add nsw i32 %storemerge4105.us.us, 1
  %127 = icmp slt i32 %storemerge4.us.us, %0
  br i1 %127, label %.lr.ph.us.us, label %._crit_edge93.us.loopexit

._crit_edge199:                                   ; preds = %._crit_edge199, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next.1, %._crit_edge199 ]
  %128 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %140, %._crit_edge199 ]
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %114
  %130 = load double, double* %129, align 8
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %119
  %132 = load double, double* %131, align 8
  %133 = fmul double %130, %132
  %134 = fadd double %128, %133
  store double %134, double* %120, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %114
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %119
  %138 = load double, double* %137, align 8
  %139 = fmul double %136, %138
  %140 = fadd double %134, %139
  store double %140, double* %120, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge102.us.us.unr-lcssa, label %._crit_edge199

.lr.ph110.split:                                  ; preds = %._crit_edge93, %.lr.ph110.split.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge93 ], [ 0, %.lr.ph110.split.preheader ]
  %indvars.iv167 = phi i64 [ %indvars.iv.next168, %._crit_edge93 ], [ 1, %.lr.ph110.split.preheader ]
  %storemerge3109 = phi i32 [ %storemerge4104, %._crit_edge93 ], [ 0, %.lr.ph110.split.preheader ]
  %141 = sub i64 %112, %indvar
  %142 = sext i32 %storemerge3109 to i64
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %142, i64 %142
  store double 1.000000e+00, double* %143, align 8
  %storemerge4104 = add nsw i32 %storemerge3109, 1
  %144 = icmp slt i32 %storemerge4104, %0
  br i1 %144, label %.lr.ph107.split.preheader, label %._crit_edge93

.lr.ph107.split.preheader:                        ; preds = %.lr.ph110.split
  %145 = sub i64 %111, %indvar
  %xtraiter221 = and i64 %145, 3
  %lcmp.mod222 = icmp eq i64 %xtraiter221, 0
  br i1 %lcmp.mod222, label %.lr.ph107.split.prol.loopexit, label %.lr.ph107.split.prol.preheader

.lr.ph107.split.prol.preheader:                   ; preds = %.lr.ph107.split.preheader
  br label %.lr.ph107.split.prol

.lr.ph107.split.prol:                             ; preds = %.lr.ph107.split.prol, %.lr.ph107.split.prol.preheader
  %indvars.iv169.prol = phi i64 [ %indvars.iv.next170.prol, %.lr.ph107.split.prol ], [ %indvars.iv167, %.lr.ph107.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph107.split.prol ], [ %xtraiter221, %.lr.ph107.split.prol.preheader ]
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %142, i64 %indvars.iv169.prol
  store double 0.000000e+00, double* %146, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv169.prol, i64 %142
  %148 = bitcast double* %147 to i64*
  store i64 0, i64* %148, align 8
  %indvars.iv.next170.prol = add nuw nsw i64 %indvars.iv169.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph107.split.prol.loopexit.unr-lcssa, label %.lr.ph107.split.prol, !llvm.loop !9

.lr.ph107.split.prol.loopexit.unr-lcssa:          ; preds = %.lr.ph107.split.prol
  br label %.lr.ph107.split.prol.loopexit

.lr.ph107.split.prol.loopexit:                    ; preds = %.lr.ph107.split.preheader, %.lr.ph107.split.prol.loopexit.unr-lcssa
  %indvars.iv169.unr = phi i64 [ %indvars.iv167, %.lr.ph107.split.preheader ], [ %indvars.iv.next170.prol, %.lr.ph107.split.prol.loopexit.unr-lcssa ]
  %149 = icmp ult i64 %141, 3
  br i1 %149, label %._crit_edge93.loopexit, label %.lr.ph107.split.preheader.new

.lr.ph107.split.preheader.new:                    ; preds = %.lr.ph107.split.prol.loopexit
  br label %.lr.ph107.split

.lr.ph107.split:                                  ; preds = %.lr.ph107.split, %.lr.ph107.split.preheader.new
  %indvars.iv169 = phi i64 [ %indvars.iv169.unr, %.lr.ph107.split.preheader.new ], [ %indvars.iv.next170.3, %.lr.ph107.split ]
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %142, i64 %indvars.iv169
  store double 0.000000e+00, double* %150, align 8
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv169, i64 %142
  %152 = bitcast double* %151 to i64*
  store i64 0, i64* %152, align 8
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %142, i64 %indvars.iv.next170
  store double 0.000000e+00, double* %153, align 8
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next170, i64 %142
  %155 = bitcast double* %154 to i64*
  store i64 0, i64* %155, align 8
  %indvars.iv.next170.1 = add nsw i64 %indvars.iv169, 2
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %142, i64 %indvars.iv.next170.1
  store double 0.000000e+00, double* %156, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next170.1, i64 %142
  %158 = bitcast double* %157 to i64*
  store i64 0, i64* %158, align 8
  %indvars.iv.next170.2 = add nsw i64 %indvars.iv169, 3
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %142, i64 %indvars.iv.next170.2
  store double 0.000000e+00, double* %159, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next170.2, i64 %142
  %161 = bitcast double* %160 to i64*
  store i64 0, i64* %161, align 8
  %indvars.iv.next170.3 = add nsw i64 %indvars.iv169, 4
  %exitcond172.3 = icmp eq i64 %indvars.iv.next170.3, %wide.trip.count175
  br i1 %exitcond172.3, label %._crit_edge93.loopexit.unr-lcssa, label %.lr.ph107.split

._crit_edge93.loopexit.unr-lcssa:                 ; preds = %.lr.ph107.split
  br label %._crit_edge93.loopexit

._crit_edge93.loopexit:                           ; preds = %.lr.ph107.split.prol.loopexit, %._crit_edge93.loopexit.unr-lcssa
  br label %._crit_edge93

._crit_edge93:                                    ; preds = %._crit_edge93.loopexit, %.lr.ph110.split
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %exitcond176 = icmp eq i64 %indvars.iv.next168, %wide.trip.count175
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond176, label %._crit_edge93._crit_edge.loopexit215, label %.lr.ph110.split

._crit_edge93._crit_edge.loopexit:                ; preds = %._crit_edge93.us
  br label %._crit_edge93._crit_edge

._crit_edge93._crit_edge.loopexit215:             ; preds = %._crit_edge93
  br label %._crit_edge93._crit_edge

._crit_edge93._crit_edge:                         ; preds = %._crit_edge93._crit_edge.loopexit215, %._crit_edge93._crit_edge.loopexit, %._crit_edge90.._crit_edge93_crit_edge, %._crit_edge90.._crit_edge93_crit_edge.thread
  %162 = phi i32 [ %78, %._crit_edge90.._crit_edge93_crit_edge.thread ], [ %109, %._crit_edge90.._crit_edge93_crit_edge ], [ %109, %._crit_edge93._crit_edge.loopexit ], [ %109, %._crit_edge93._crit_edge.loopexit215 ]
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %163, i64 %163
  store double 1.000000e+00, double* %164, align 8
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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.._crit_edge_crit_edge.us.preheader, label %._crit_edge

.._crit_edge_crit_edge.us.preheader:              ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %.._crit_edge_crit_edge.us.preheader, %._crit_edge._crit_edge.us
  %storemerge12.us = phi i32 [ %21, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.us.preheader ]
  %8 = mul nsw i32 %storemerge12.us, %0
  %9 = sext i32 %storemerge12.us to i64
  %10 = zext i32 %8 to i64
  br label %._crit_edge10.us._crit_edge

._crit_edge10.us._crit_edge:                      ; preds = %._crit_edge10.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge10.us ]
  %11 = add i64 %indvars.iv, %10
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge10.us

; <label>:15:                                     ; preds = %._crit_edge10.us._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us._crit_edge, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %9, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %._crit_edge10.us._crit_edge

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge10.us
  %21 = add nsw i32 %storemerge12.us, 1
  %22 = icmp slt i32 %21, %0
  br i1 %22, label %.._crit_edge_crit_edge.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = distinct !{!6, !5}
!7 = distinct !{!7, !8, !2, !3}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !5}
