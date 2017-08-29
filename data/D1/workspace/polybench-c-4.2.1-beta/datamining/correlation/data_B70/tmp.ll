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
  br i1 %16, label %17, label %.._crit_edge_crit_edge17

.._crit_edge_crit_edge17:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge17, %.._crit_edge_crit_edge, %17
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

.._crit_edge_crit_edge:                           ; preds = %..._crit_edge_crit_edge_crit_edge, %2
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %..._crit_edge_crit_edge_crit_edge ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge.._crit_edge_crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond3, label %20, label %..._crit_edge_crit_edge_crit_edge

..._crit_edge_crit_edge_crit_edge:                ; preds = %19
  br label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph135, label %.._crit_edge.._crit_edge90_crit_edge_crit_edge

.._crit_edge.._crit_edge90_crit_edge_crit_edge:   ; preds = %7
  br label %._crit_edge.._crit_edge90_crit_edge

.lr.ph135:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph135.split.us.preheader, label %.lr.ph135.split.preheader

.lr.ph135.split.preheader:                        ; preds = %.lr.ph135
  %10 = zext i32 %0 to i64
  %11 = add nsw i64 %10, -1
  %xtraiter248 = and i64 %10, 3
  %lcmp.mod249 = icmp eq i64 %xtraiter248, 0
  br i1 %lcmp.mod249, label %.lr.ph135.split.preheader..lr.ph135.split.prol.loopexit_crit_edge, label %.lr.ph135.split.prol.preheader

.lr.ph135.split.preheader..lr.ph135.split.prol.loopexit_crit_edge: ; preds = %.lr.ph135.split.preheader
  br label %.lr.ph135.split.prol.loopexit

.lr.ph135.split.prol.preheader:                   ; preds = %.lr.ph135.split.preheader
  %12 = fdiv double 0.000000e+00, %2
  br label %.lr.ph135.split.prol

.lr.ph135.split.prol:                             ; preds = %.lr.ph135.split.prol..lr.ph135.split.prol_crit_edge, %.lr.ph135.split.prol.preheader
  %indvars.iv189.prol = phi i64 [ %indvars.iv.next190.prol, %.lr.ph135.split.prol..lr.ph135.split.prol_crit_edge ], [ 0, %.lr.ph135.split.prol.preheader ]
  %prol.iter250 = phi i64 [ %prol.iter250.sub, %.lr.ph135.split.prol..lr.ph135.split.prol_crit_edge ], [ %xtraiter248, %.lr.ph135.split.prol.preheader ]
  %13 = getelementptr inbounds double, double* %5, i64 %indvars.iv189.prol
  store double %12, double* %13, align 8
  %indvars.iv.next190.prol = add nuw nsw i64 %indvars.iv189.prol, 1
  %prol.iter250.sub = add i64 %prol.iter250, -1
  %prol.iter250.cmp = icmp eq i64 %prol.iter250.sub, 0
  br i1 %prol.iter250.cmp, label %.lr.ph135.split.prol.loopexit.loopexit, label %.lr.ph135.split.prol..lr.ph135.split.prol_crit_edge, !llvm.loop !1

.lr.ph135.split.prol..lr.ph135.split.prol_crit_edge: ; preds = %.lr.ph135.split.prol
  br label %.lr.ph135.split.prol

.lr.ph135.split.prol.loopexit.loopexit:           ; preds = %.lr.ph135.split.prol
  br label %.lr.ph135.split.prol.loopexit

.lr.ph135.split.prol.loopexit:                    ; preds = %.lr.ph135.split.preheader..lr.ph135.split.prol.loopexit_crit_edge, %.lr.ph135.split.prol.loopexit.loopexit
  %indvars.iv189.unr = phi i64 [ 0, %.lr.ph135.split.preheader..lr.ph135.split.prol.loopexit_crit_edge ], [ %indvars.iv.next190.prol, %.lr.ph135.split.prol.loopexit.loopexit ]
  %14 = icmp ult i64 %11, 3
  br i1 %14, label %.lr.ph135.split.prol.loopexit..._crit_edge_crit_edge_crit_edge, label %.lr.ph135.split.preheader255

.lr.ph135.split.prol.loopexit..._crit_edge_crit_edge_crit_edge: ; preds = %.lr.ph135.split.prol.loopexit
  br label %.._crit_edge_crit_edge

.lr.ph135.split.preheader255:                     ; preds = %.lr.ph135.split.prol.loopexit
  %15 = fdiv double 0.000000e+00, %2
  %16 = add nsw i64 %10, -4
  %17 = sub i64 %16, %indvars.iv189.unr
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check = icmp ult i64 %19, 4
  br i1 %min.iters.check, label %.lr.ph135.split.preheader255..lr.ph135.split.preheader281_crit_edge, label %min.iters.checked

.lr.ph135.split.preheader255..lr.ph135.split.preheader281_crit_edge: ; preds = %.lr.ph135.split.preheader255
  br label %.lr.ph135.split.preheader281

.lr.ph135.split.preheader281:                     ; preds = %middle.block..lr.ph135.split.preheader281_crit_edge, %min.iters.checked..lr.ph135.split.preheader281_crit_edge, %.lr.ph135.split.preheader255..lr.ph135.split.preheader281_crit_edge
  %indvars.iv189.ph = phi i64 [ %indvars.iv189.unr, %min.iters.checked..lr.ph135.split.preheader281_crit_edge ], [ %indvars.iv189.unr, %.lr.ph135.split.preheader255..lr.ph135.split.preheader281_crit_edge ], [ %ind.end, %middle.block..lr.ph135.split.preheader281_crit_edge ]
  br label %.lr.ph135.split

min.iters.checked:                                ; preds = %.lr.ph135.split.preheader255
  %n.mod.vf = and i64 %19, 3
  %n.vec = sub nsw i64 %19, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %20 = shl nuw i64 %18, 2
  %21 = add i64 %indvars.iv189.unr, %20
  %22 = add i64 %21, 4
  %23 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %22, %23
  br i1 %cmp.zero, label %min.iters.checked..lr.ph135.split.preheader281_crit_edge, label %vector.ph

min.iters.checked..lr.ph135.split.preheader281_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph135.split.preheader281

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert264 = insertelement <2 x double> undef, double %15, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert264, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %24 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv189.unr, %24
  %25 = add nsw i64 %offset.idx, 3
  %26 = add i64 %offset.idx, 11
  %27 = getelementptr inbounds double, double* %5, i64 %25
  %28 = getelementptr inbounds double, double* %5, i64 %26
  %29 = getelementptr double, double* %27, i64 -3
  %30 = bitcast double* %29 to <8 x double>*
  %31 = getelementptr double, double* %28, i64 -3
  %32 = bitcast double* %31 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %30, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %32, align 8
  %index.next = add i64 %index, 4
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block..._crit_edge_crit_edge_crit_edge, label %middle.block..lr.ph135.split.preheader281_crit_edge

middle.block..lr.ph135.split.preheader281_crit_edge: ; preds = %middle.block
  br label %.lr.ph135.split.preheader281

middle.block..._crit_edge_crit_edge_crit_edge:    ; preds = %middle.block
  br label %.._crit_edge_crit_edge

.lr.ph135.split.us.preheader:                     ; preds = %.lr.ph135
  %34 = zext i32 %1 to i64
  %35 = zext i32 %0 to i64
  %xtraiter243 = and i64 %34, 1
  %lcmp.mod244 = icmp eq i64 %xtraiter243, 0
  %36 = icmp eq i32 %1, 1
  %sunkaddr198 = ptrtoint double* %5 to i64
  br label %.lr.ph135.split.us

.lr.ph135.split.us:                               ; preds = %._crit_edge.us..lr.ph135.split.us_crit_edge, %.lr.ph135.split.us.preheader
  %indvars.iv185 = phi i64 [ 0, %.lr.ph135.split.us.preheader ], [ %indvars.iv.next186, %._crit_edge.us..lr.ph135.split.us_crit_edge ]
  %37 = getelementptr inbounds double, double* %5, i64 %indvars.iv185
  store double 0.000000e+00, double* %37, align 8
  br i1 %lcmp.mod244, label %.lr.ph135.split.us..prol.loopexit242_crit_edge, label %.prol.preheader241

.lr.ph135.split.us..prol.loopexit242_crit_edge:   ; preds = %.lr.ph135.split.us
  br label %.prol.loopexit242

.prol.preheader241:                               ; preds = %.lr.ph135.split.us
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv185
  %39 = load double, double* %38, align 8
  %40 = fadd double %39, 0.000000e+00
  %sunkaddr195.prol = shl nuw nsw i64 %indvars.iv185, 3
  %sunkaddr196.prol = add i64 %sunkaddr198, %sunkaddr195.prol
  %sunkaddr197.prol = inttoptr i64 %sunkaddr196.prol to double*
  store double %40, double* %sunkaddr197.prol, align 8
  br label %.prol.loopexit242

.prol.loopexit242:                                ; preds = %.lr.ph135.split.us..prol.loopexit242_crit_edge, %.prol.preheader241
  %.lcssa219.unr.ph = phi double [ %40, %.prol.preheader241 ], [ undef, %.lr.ph135.split.us..prol.loopexit242_crit_edge ]
  %indvars.iv181.unr.ph = phi i64 [ 1, %.prol.preheader241 ], [ 0, %.lr.ph135.split.us..prol.loopexit242_crit_edge ]
  %.unr245.ph = phi double [ %40, %.prol.preheader241 ], [ 0.000000e+00, %.lr.ph135.split.us..prol.loopexit242_crit_edge ]
  br i1 %36, label %.prol.loopexit242.._crit_edge.us_crit_edge, label %.lr.ph135.split.us.new.preheader

.prol.loopexit242.._crit_edge.us_crit_edge:       ; preds = %.prol.loopexit242
  %.pre = shl nuw nsw i64 %indvars.iv185, 3
  %.pre273 = add i64 %sunkaddr198, %.pre
  %.pre274 = inttoptr i64 %.pre273 to double*
  br label %._crit_edge.us

.lr.ph135.split.us.new.preheader:                 ; preds = %.prol.loopexit242
  %sunkaddr195 = shl nuw nsw i64 %indvars.iv185, 3
  %sunkaddr196 = add i64 %sunkaddr198, %sunkaddr195
  %sunkaddr197 = inttoptr i64 %sunkaddr196 to double*
  br label %.lr.ph135.split.us.new

.lr.ph135.split.us.new:                           ; preds = %.lr.ph135.split.us.new..lr.ph135.split.us.new_crit_edge, %.lr.ph135.split.us.new.preheader
  %indvars.iv181 = phi i64 [ %indvars.iv.next182.1, %.lr.ph135.split.us.new..lr.ph135.split.us.new_crit_edge ], [ %indvars.iv181.unr.ph, %.lr.ph135.split.us.new.preheader ]
  %41 = phi double [ %47, %.lr.ph135.split.us.new..lr.ph135.split.us.new_crit_edge ], [ %.unr245.ph, %.lr.ph135.split.us.new.preheader ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv181, i64 %indvars.iv185
  %43 = load double, double* %42, align 8
  %44 = fadd double %43, %41
  store double %44, double* %sunkaddr197, align 8
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next182, i64 %indvars.iv185
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %sunkaddr197, align 8
  %indvars.iv.next182.1 = add nsw i64 %indvars.iv181, 2
  %exitcond240.1 = icmp eq i64 %indvars.iv.next182.1, %34
  br i1 %exitcond240.1, label %._crit_edge.us.loopexit, label %.lr.ph135.split.us.new..lr.ph135.split.us.new_crit_edge

.lr.ph135.split.us.new..lr.ph135.split.us.new_crit_edge: ; preds = %.lr.ph135.split.us.new
  br label %.lr.ph135.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph135.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit242.._crit_edge.us_crit_edge
  %sunkaddr201.pre-phi = phi double* [ %.pre274, %.prol.loopexit242.._crit_edge.us_crit_edge ], [ %sunkaddr197, %._crit_edge.us.loopexit ]
  %.lcssa219 = phi double [ %.lcssa219.unr.ph, %.prol.loopexit242.._crit_edge.us_crit_edge ], [ %47, %._crit_edge.us.loopexit ]
  %48 = fdiv double %.lcssa219, %2
  store double %48, double* %sunkaddr201.pre-phi, align 8
  %indvars.iv.next186 = add nuw nsw i64 %indvars.iv185, 1
  %exitcond246 = icmp eq i64 %indvars.iv.next186, %35
  br i1 %exitcond246, label %.._crit_edge_crit_edge.loopexit, label %._crit_edge.us..lr.ph135.split.us_crit_edge

._crit_edge.us..lr.ph135.split.us_crit_edge:      ; preds = %._crit_edge.us
  br label %.lr.ph135.split.us

.._crit_edge_crit_edge.loopexit:                  ; preds = %._crit_edge.us
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge.loopexit282:               ; preds = %.lr.ph135.split
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %middle.block..._crit_edge_crit_edge_crit_edge, %.lr.ph135.split.prol.loopexit..._crit_edge_crit_edge_crit_edge, %.._crit_edge_crit_edge.loopexit282, %.._crit_edge_crit_edge.loopexit
  br i1 true, label %.lr.ph129, label %.._crit_edge_crit_edge.._crit_edge.._crit_edge90_crit_edge_crit_edge

.._crit_edge_crit_edge.._crit_edge.._crit_edge90_crit_edge_crit_edge: ; preds = %.._crit_edge_crit_edge
  br label %._crit_edge.._crit_edge90_crit_edge

.lr.ph129:                                        ; preds = %.._crit_edge_crit_edge
  br i1 %9, label %.lr.ph129.split.us.preheader, label %.lr.ph129.split.preheader

.lr.ph129.split.preheader:                        ; preds = %.lr.ph129
  %49 = zext i32 %0 to i64
  %xtraiter238 = and i64 %49, 1
  %lcmp.mod239 = icmp eq i64 %xtraiter238, 0
  br i1 %lcmp.mod239, label %.lr.ph129.split.preheader..lr.ph129.split.prol.loopexit_crit_edge, label %.lr.ph129.split.prol

.lr.ph129.split.preheader..lr.ph129.split.prol.loopexit_crit_edge: ; preds = %.lr.ph129.split.preheader
  br label %.lr.ph129.split.prol.loopexit

.lr.ph129.split.prol:                             ; preds = %.lr.ph129.split.preheader
  %50 = fdiv double 0.000000e+00, %2
  store double %50, double* %6, align 8
  %51 = tail call double @sqrt(double %50) #4
  %52 = fcmp ugt double %51, 1.000000e-01
  %53 = select i1 %52, double %51, double 1.000000e+00
  store double %53, double* %6, align 8
  br label %.lr.ph129.split.prol.loopexit

.lr.ph129.split.prol.loopexit:                    ; preds = %.lr.ph129.split.preheader..lr.ph129.split.prol.loopexit_crit_edge, %.lr.ph129.split.prol
  %indvars.iv177.unr = phi i64 [ 1, %.lr.ph129.split.prol ], [ 0, %.lr.ph129.split.preheader..lr.ph129.split.prol.loopexit_crit_edge ]
  %54 = icmp eq i32 %0, 1
  br i1 %54, label %.lr.ph129.split.prol.loopexit.._crit_edge.._crit_edge90_crit_edge_crit_edge, label %.lr.ph129.split.preheader253

.lr.ph129.split.prol.loopexit.._crit_edge.._crit_edge90_crit_edge_crit_edge: ; preds = %.lr.ph129.split.prol.loopexit
  br label %._crit_edge.._crit_edge90_crit_edge

.lr.ph129.split.preheader253:                     ; preds = %.lr.ph129.split.prol.loopexit
  %55 = fdiv double 0.000000e+00, %2
  br label %.lr.ph129.split

.lr.ph129.split.us.preheader:                     ; preds = %.lr.ph129
  %56 = zext i32 %1 to i64
  %57 = zext i32 %0 to i64
  %xtraiter233 = and i64 %56, 1
  %lcmp.mod234 = icmp eq i64 %xtraiter233, 0
  %58 = icmp eq i32 %1, 1
  %sunkaddr210 = ptrtoint double* %6 to i64
  %sunkaddr202 = ptrtoint double* %5 to i64
  br label %.lr.ph129.split.us

.lr.ph129.split.us:                               ; preds = %._crit_edge126.us..lr.ph129.split.us_crit_edge, %.lr.ph129.split.us.preheader
  %indvars.iv173 = phi i64 [ 0, %.lr.ph129.split.us.preheader ], [ %indvars.iv.next174, %._crit_edge126.us..lr.ph129.split.us_crit_edge ]
  %59 = getelementptr inbounds double, double* %6, i64 %indvars.iv173
  store double 0.000000e+00, double* %59, align 8
  br i1 %lcmp.mod234, label %.lr.ph129.split.us..prol.loopexit232_crit_edge, label %.prol.preheader231

.lr.ph129.split.us..prol.loopexit232_crit_edge:   ; preds = %.lr.ph129.split.us
  br label %.prol.loopexit232

.prol.preheader231:                               ; preds = %.lr.ph129.split.us
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv173
  %61 = load double, double* %60, align 8
  %sunkaddr203.prol = shl nuw nsw i64 %indvars.iv173, 3
  %sunkaddr204.prol = add i64 %sunkaddr202, %sunkaddr203.prol
  %sunkaddr205.prol = inttoptr i64 %sunkaddr204.prol to double*
  %62 = load double, double* %sunkaddr205.prol, align 8
  %63 = fsub double %61, %62
  %64 = fmul double %63, %63
  %65 = fadd double %64, 0.000000e+00
  %sunkaddr208.prol = add i64 %sunkaddr210, %sunkaddr203.prol
  %sunkaddr209.prol = inttoptr i64 %sunkaddr208.prol to double*
  store double %65, double* %sunkaddr209.prol, align 8
  br label %.prol.loopexit232

.prol.loopexit232:                                ; preds = %.lr.ph129.split.us..prol.loopexit232_crit_edge, %.prol.preheader231
  %.lcssa218.unr.ph = phi double [ %65, %.prol.preheader231 ], [ undef, %.lr.ph129.split.us..prol.loopexit232_crit_edge ]
  %indvars.iv169.unr.ph = phi i64 [ 1, %.prol.preheader231 ], [ 0, %.lr.ph129.split.us..prol.loopexit232_crit_edge ]
  %.unr235.ph = phi double [ %65, %.prol.preheader231 ], [ 0.000000e+00, %.lr.ph129.split.us..prol.loopexit232_crit_edge ]
  br i1 %58, label %.prol.loopexit232.._crit_edge126.us_crit_edge, label %.lr.ph129.split.us.new.preheader

.prol.loopexit232.._crit_edge126.us_crit_edge:    ; preds = %.prol.loopexit232
  %.pre275 = shl nuw nsw i64 %indvars.iv173, 3
  %.pre276 = add i64 %sunkaddr210, %.pre275
  %.pre277 = inttoptr i64 %.pre276 to double*
  br label %._crit_edge126.us

.lr.ph129.split.us.new.preheader:                 ; preds = %.prol.loopexit232
  %sunkaddr203 = shl nuw nsw i64 %indvars.iv173, 3
  %sunkaddr204 = add i64 %sunkaddr202, %sunkaddr203
  %sunkaddr205 = inttoptr i64 %sunkaddr204 to double*
  %sunkaddr208 = add i64 %sunkaddr210, %sunkaddr203
  %sunkaddr209 = inttoptr i64 %sunkaddr208 to double*
  br label %.lr.ph129.split.us.new

.lr.ph129.split.us.new:                           ; preds = %.lr.ph129.split.us.new..lr.ph129.split.us.new_crit_edge, %.lr.ph129.split.us.new.preheader
  %indvars.iv169 = phi i64 [ %indvars.iv.next170.1, %.lr.ph129.split.us.new..lr.ph129.split.us.new_crit_edge ], [ %indvars.iv169.unr.ph, %.lr.ph129.split.us.new.preheader ]
  %66 = phi double [ %78, %.lr.ph129.split.us.new..lr.ph129.split.us.new_crit_edge ], [ %.unr235.ph, %.lr.ph129.split.us.new.preheader ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv169, i64 %indvars.iv173
  %68 = load double, double* %67, align 8
  %69 = load double, double* %sunkaddr205, align 8
  %70 = fsub double %68, %69
  %71 = fmul double %70, %70
  %72 = fadd double %66, %71
  store double %72, double* %sunkaddr209, align 8
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next170, i64 %indvars.iv173
  %74 = load double, double* %73, align 8
  %75 = load double, double* %sunkaddr205, align 8
  %76 = fsub double %74, %75
  %77 = fmul double %76, %76
  %78 = fadd double %72, %77
  store double %78, double* %sunkaddr209, align 8
  %indvars.iv.next170.1 = add nsw i64 %indvars.iv169, 2
  %exitcond230.1 = icmp eq i64 %indvars.iv.next170.1, %56
  br i1 %exitcond230.1, label %._crit_edge126.us.loopexit, label %.lr.ph129.split.us.new..lr.ph129.split.us.new_crit_edge

.lr.ph129.split.us.new..lr.ph129.split.us.new_crit_edge: ; preds = %.lr.ph129.split.us.new
  br label %.lr.ph129.split.us.new

._crit_edge126.us.loopexit:                       ; preds = %.lr.ph129.split.us.new
  br label %._crit_edge126.us

._crit_edge126.us:                                ; preds = %._crit_edge126.us.loopexit, %.prol.loopexit232.._crit_edge126.us_crit_edge
  %sunkaddr213.pre-phi = phi double* [ %.pre277, %.prol.loopexit232.._crit_edge126.us_crit_edge ], [ %sunkaddr209, %._crit_edge126.us.loopexit ]
  %.lcssa218 = phi double [ %.lcssa218.unr.ph, %.prol.loopexit232.._crit_edge126.us_crit_edge ], [ %78, %._crit_edge126.us.loopexit ]
  %79 = fdiv double %.lcssa218, %2
  store double %79, double* %sunkaddr213.pre-phi, align 8
  %80 = tail call double @sqrt(double %79) #4
  %81 = fcmp ugt double %80, 1.000000e-01
  %82 = select i1 %81, double %80, double 1.000000e+00
  store double %82, double* %sunkaddr213.pre-phi, align 8
  %indvars.iv.next174 = add nuw nsw i64 %indvars.iv173, 1
  %exitcond236 = icmp eq i64 %indvars.iv.next174, %57
  br i1 %exitcond236, label %._crit_edge.._crit_edge90_crit_edge.loopexit, label %._crit_edge126.us..lr.ph129.split.us_crit_edge

._crit_edge126.us..lr.ph129.split.us_crit_edge:   ; preds = %._crit_edge126.us
  br label %.lr.ph129.split.us

.lr.ph135.split:                                  ; preds = %.lr.ph135.split..lr.ph135.split_crit_edge, %.lr.ph135.split.preheader281
  %indvars.iv189 = phi i64 [ %indvars.iv.next190.3, %.lr.ph135.split..lr.ph135.split_crit_edge ], [ %indvars.iv189.ph, %.lr.ph135.split.preheader281 ]
  %83 = getelementptr inbounds double, double* %5, i64 %indvars.iv189
  store double %15, double* %83, align 8
  %indvars.iv.next190 = add nuw nsw i64 %indvars.iv189, 1
  %84 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next190
  store double %15, double* %84, align 8
  %indvars.iv.next190.1 = add nsw i64 %indvars.iv189, 2
  %85 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next190.1
  store double %15, double* %85, align 8
  %indvars.iv.next190.2 = add nsw i64 %indvars.iv189, 3
  %86 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next190.2
  store double %15, double* %86, align 8
  %indvars.iv.next190.3 = add nsw i64 %indvars.iv189, 4
  %exitcond247.3 = icmp eq i64 %indvars.iv.next190.3, %10
  br i1 %exitcond247.3, label %.._crit_edge_crit_edge.loopexit282, label %.lr.ph135.split..lr.ph135.split_crit_edge, !llvm.loop !6

.lr.ph135.split..lr.ph135.split_crit_edge:        ; preds = %.lr.ph135.split
  br label %.lr.ph135.split

._crit_edge.._crit_edge90_crit_edge.loopexit:     ; preds = %._crit_edge126.us
  br label %._crit_edge.._crit_edge90_crit_edge

._crit_edge.._crit_edge90_crit_edge.loopexit280:  ; preds = %.lr.ph129.split
  br label %._crit_edge.._crit_edge90_crit_edge

._crit_edge.._crit_edge90_crit_edge:              ; preds = %.lr.ph129.split.prol.loopexit.._crit_edge.._crit_edge90_crit_edge_crit_edge, %.._crit_edge.._crit_edge90_crit_edge_crit_edge, %._crit_edge.._crit_edge90_crit_edge.loopexit280, %._crit_edge.._crit_edge90_crit_edge.loopexit, %.._crit_edge_crit_edge.._crit_edge.._crit_edge90_crit_edge_crit_edge
  %87 = icmp sgt i32 %1, 0
  br i1 %87, label %._crit_edge90.._crit_edge92_crit_edge.lr.ph, label %._crit_edge.._crit_edge90_crit_edge.._crit_edge90.._crit_edge93_crit_edge_crit_edge

._crit_edge.._crit_edge90_crit_edge.._crit_edge90.._crit_edge93_crit_edge_crit_edge: ; preds = %._crit_edge.._crit_edge90_crit_edge
  br label %._crit_edge90.._crit_edge93_crit_edge

._crit_edge90.._crit_edge92_crit_edge.lr.ph:      ; preds = %._crit_edge.._crit_edge90_crit_edge
  br i1 %8, label %._crit_edge90.._crit_edge92_crit_edge.us.preheader, label %._crit_edge90.._crit_edge93_crit_edge.thread

._crit_edge90.._crit_edge93_crit_edge.thread:     ; preds = %._crit_edge90.._crit_edge92_crit_edge.lr.ph
  %88 = add nsw i32 %0, -1
  br label %._crit_edge93._crit_edge

._crit_edge90.._crit_edge92_crit_edge.us.preheader: ; preds = %._crit_edge90.._crit_edge92_crit_edge.lr.ph
  %89 = zext i32 %0 to i64
  %90 = zext i32 %1 to i64
  br label %._crit_edge90.._crit_edge92_crit_edge.us

._crit_edge90.._crit_edge92_crit_edge.us:         ; preds = %._crit_edge92._crit_edge.us.._crit_edge90.._crit_edge92_crit_edge.us_crit_edge, %._crit_edge90.._crit_edge92_crit_edge.us.preheader
  %indvars.iv164 = phi i64 [ 0, %._crit_edge90.._crit_edge92_crit_edge.us.preheader ], [ %indvars.iv.next165, %._crit_edge92._crit_edge.us.._crit_edge90.._crit_edge92_crit_edge.us_crit_edge ]
  br label %._crit_edge92.us

._crit_edge92.us:                                 ; preds = %._crit_edge92.us.._crit_edge92.us_crit_edge, %._crit_edge90.._crit_edge92_crit_edge.us
  %indvars.iv160 = phi i64 [ 0, %._crit_edge90.._crit_edge92_crit_edge.us ], [ %indvars.iv.next161, %._crit_edge92.us.._crit_edge92.us_crit_edge ]
  %91 = getelementptr inbounds double, double* %5, i64 %indvars.iv160
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv164, i64 %indvars.iv160
  %94 = load double, double* %93, align 8
  %95 = fsub double %94, %92
  store double %95, double* %93, align 8
  %96 = tail call double @sqrt(double %2) #4
  %97 = getelementptr inbounds double, double* %6, i64 %indvars.iv160
  %98 = load double, double* %97, align 8
  %99 = fmul double %96, %98
  %100 = load double, double* %93, align 8
  %101 = fdiv double %100, %99
  store double %101, double* %93, align 8
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %exitcond228 = icmp eq i64 %indvars.iv.next161, %89
  br i1 %exitcond228, label %._crit_edge92._crit_edge.us, label %._crit_edge92.us.._crit_edge92.us_crit_edge

._crit_edge92.us.._crit_edge92.us_crit_edge:      ; preds = %._crit_edge92.us
  br label %._crit_edge92.us

._crit_edge92._crit_edge.us:                      ; preds = %._crit_edge92.us
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond229 = icmp eq i64 %indvars.iv.next165, %90
  br i1 %exitcond229, label %._crit_edge90.._crit_edge93_crit_edge.loopexit, label %._crit_edge92._crit_edge.us.._crit_edge90.._crit_edge92_crit_edge.us_crit_edge

._crit_edge92._crit_edge.us.._crit_edge90.._crit_edge92_crit_edge.us_crit_edge: ; preds = %._crit_edge92._crit_edge.us
  br label %._crit_edge90.._crit_edge92_crit_edge.us

.lr.ph129.split:                                  ; preds = %.lr.ph129.split..lr.ph129.split_crit_edge, %.lr.ph129.split.preheader253
  %indvars.iv177 = phi i64 [ %indvars.iv.next178.1, %.lr.ph129.split..lr.ph129.split_crit_edge ], [ %indvars.iv177.unr, %.lr.ph129.split.preheader253 ]
  %102 = getelementptr inbounds double, double* %6, i64 %indvars.iv177
  store double %55, double* %102, align 8
  %103 = tail call double @sqrt(double %55) #4
  %104 = fcmp ugt double %103, 1.000000e-01
  %105 = select i1 %104, double %103, double 1.000000e+00
  store double %105, double* %102, align 8
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %106 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next178
  store double %55, double* %106, align 8
  %107 = tail call double @sqrt(double %55) #4
  %108 = fcmp ugt double %107, 1.000000e-01
  %109 = select i1 %108, double %107, double 1.000000e+00
  store double %109, double* %106, align 8
  %indvars.iv.next178.1 = add nsw i64 %indvars.iv177, 2
  %exitcond237.1 = icmp eq i64 %indvars.iv.next178.1, %49
  br i1 %exitcond237.1, label %._crit_edge.._crit_edge90_crit_edge.loopexit280, label %.lr.ph129.split..lr.ph129.split_crit_edge

.lr.ph129.split..lr.ph129.split_crit_edge:        ; preds = %.lr.ph129.split
  br label %.lr.ph129.split

._crit_edge90.._crit_edge93_crit_edge.loopexit:   ; preds = %._crit_edge92._crit_edge.us
  br label %._crit_edge90.._crit_edge93_crit_edge

._crit_edge90.._crit_edge93_crit_edge:            ; preds = %._crit_edge.._crit_edge90_crit_edge.._crit_edge90.._crit_edge93_crit_edge_crit_edge, %._crit_edge90.._crit_edge93_crit_edge.loopexit
  %110 = add nsw i32 %0, -1
  %111 = icmp sgt i32 %0, 1
  br i1 %111, label %.lr.ph110, label %._crit_edge90.._crit_edge93_crit_edge.._crit_edge93._crit_edge_crit_edge

._crit_edge90.._crit_edge93_crit_edge.._crit_edge93._crit_edge_crit_edge: ; preds = %._crit_edge90.._crit_edge93_crit_edge
  br label %._crit_edge93._crit_edge

.lr.ph110:                                        ; preds = %._crit_edge90.._crit_edge93_crit_edge
  %112 = sext i32 %0 to i64
  br i1 %87, label %.lr.ph110.split.us.preheader, label %.lr.ph110.split.preheader

.lr.ph110.split.preheader:                        ; preds = %.lr.ph110
  %113 = zext i32 %0 to i64
  %114 = add nuw nsw i64 %113, 3
  %115 = add nsw i64 %113, -2
  %116 = zext i32 %110 to i64
  br label %.lr.ph110.split

.lr.ph110.split.us.preheader:                     ; preds = %.lr.ph110
  %117 = zext i32 %1 to i64
  %118 = zext i32 %0 to i64
  %119 = zext i32 %110 to i64
  %xtraiter = and i64 %117, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %120 = icmp eq i32 %1, 1
  br label %.lr.ph110.split.us

.lr.ph110.split.us:                               ; preds = %._crit_edge93.us..lr.ph110.split.us_crit_edge, %.lr.ph110.split.us.preheader
  %indvars.iv146 = phi i64 [ 0, %.lr.ph110.split.us.preheader ], [ %indvars.iv.next147, %._crit_edge93.us..lr.ph110.split.us_crit_edge ]
  %indvars.iv140 = phi i64 [ 1, %.lr.ph110.split.us.preheader ], [ %indvars.iv.next141, %._crit_edge93.us..lr.ph110.split.us_crit_edge ]
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv146, i64 %indvars.iv146
  store double 1.000000e+00, double* %121, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %122 = icmp slt i64 %indvars.iv.next147, %112
  br i1 %122, label %.lr.ph.us.us.preheader, label %.lr.ph110.split.us.._crit_edge93.us_crit_edge

.lr.ph110.split.us.._crit_edge93.us_crit_edge:    ; preds = %.lr.ph110.split.us
  br label %._crit_edge93.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph110.split.us
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv146
  br label %.lr.ph.us.us

._crit_edge93.us.loopexit:                        ; preds = %._crit_edge102.us.us
  br label %._crit_edge93.us

._crit_edge93.us:                                 ; preds = %.lr.ph110.split.us.._crit_edge93.us_crit_edge, %._crit_edge93.us.loopexit
  %exitcond222 = icmp eq i64 %indvars.iv.next147, %119
  br i1 %exitcond222, label %._crit_edge93._crit_edge.loopexit, label %._crit_edge93.us..lr.ph110.split.us_crit_edge

._crit_edge93.us..lr.ph110.split.us_crit_edge:    ; preds = %._crit_edge93.us
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  br label %.lr.ph110.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge102.us.us..lr.ph.us.us_crit_edge, %.lr.ph.us.us.preheader
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %._crit_edge102.us.us..lr.ph.us.us_crit_edge ], [ %indvars.iv140, %.lr.ph.us.us.preheader ]
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv146, i64 %indvars.iv142
  store double 0.000000e+00, double* %124, align 8
  br i1 %lcmp.mod, label %.lr.ph.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us.us..prol.loopexit_crit_edge:            ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %125 = load double, double* %123, align 8
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv142
  %127 = load double, double* %126, align 8
  %128 = fmul double %125, %127
  %129 = fadd double %128, 0.000000e+00
  store double %129, double* %124, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %.lcssa.unr.ph = phi double [ %129, %.prol.preheader ], [ undef, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  %.unr.ph = phi double [ %129, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  br i1 %120, label %.prol.loopexit.._crit_edge102.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge102.us.us_crit_edge:    ; preds = %.prol.loopexit
  br label %._crit_edge102.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge102.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  br label %._crit_edge102.us.us

._crit_edge102.us.us:                             ; preds = %.prol.loopexit.._crit_edge102.us.us_crit_edge, %._crit_edge102.us.us.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit.._crit_edge102.us.us_crit_edge ], [ %143, %._crit_edge102.us.us.loopexit ]
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv142, i64 %indvars.iv146
  store double %.lcssa, double* %130, align 8
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %exitcond = icmp eq i64 %indvars.iv.next143, %118
  br i1 %exitcond, label %._crit_edge93.us.loopexit, label %._crit_edge102.us.us..lr.ph.us.us_crit_edge

._crit_edge102.us.us..lr.ph.us.us_crit_edge:      ; preds = %._crit_edge102.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %131 = phi double [ %143, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv146
  %133 = load double, double* %132, align 8
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv142
  %135 = load double, double* %134, align 8
  %136 = fmul double %133, %135
  %137 = fadd double %131, %136
  store double %137, double* %124, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv146
  %139 = load double, double* %138, align 8
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv142
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = fadd double %137, %142
  store double %143, double* %124, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond220.1 = icmp eq i64 %indvars.iv.next.1, %117
  br i1 %exitcond220.1, label %._crit_edge102.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.lr.ph110.split:                                  ; preds = %._crit_edge93..lr.ph110.split_crit_edge, %.lr.ph110.split.preheader
  %indvars.iv156 = phi i64 [ 0, %.lr.ph110.split.preheader ], [ %indvars.iv.next157, %._crit_edge93..lr.ph110.split_crit_edge ]
  %indvars.iv150 = phi i64 [ 1, %.lr.ph110.split.preheader ], [ %indvars.iv.next151, %._crit_edge93..lr.ph110.split_crit_edge ]
  %144 = sub i64 %115, %indvars.iv156
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv156, i64 %indvars.iv156
  store double 1.000000e+00, double* %145, align 8
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %146 = icmp slt i64 %indvars.iv.next157, %112
  br i1 %146, label %.lr.ph107.split.preheader, label %.lr.ph110.split.._crit_edge93_crit_edge

.lr.ph110.split.._crit_edge93_crit_edge:          ; preds = %.lr.ph110.split
  br label %._crit_edge93

.lr.ph107.split.preheader:                        ; preds = %.lr.ph110.split
  %147 = sub i64 %114, %indvars.iv156
  %xtraiter225 = and i64 %147, 3
  %lcmp.mod226 = icmp eq i64 %xtraiter225, 0
  br i1 %lcmp.mod226, label %.lr.ph107.split.preheader..lr.ph107.split.prol.loopexit_crit_edge, label %.lr.ph107.split.prol.preheader

.lr.ph107.split.preheader..lr.ph107.split.prol.loopexit_crit_edge: ; preds = %.lr.ph107.split.preheader
  br label %.lr.ph107.split.prol.loopexit

.lr.ph107.split.prol.preheader:                   ; preds = %.lr.ph107.split.preheader
  br label %.lr.ph107.split.prol

.lr.ph107.split.prol:                             ; preds = %.lr.ph107.split.prol..lr.ph107.split.prol_crit_edge, %.lr.ph107.split.prol.preheader
  %indvars.iv152.prol = phi i64 [ %indvars.iv.next153.prol, %.lr.ph107.split.prol..lr.ph107.split.prol_crit_edge ], [ %indvars.iv150, %.lr.ph107.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph107.split.prol..lr.ph107.split.prol_crit_edge ], [ %xtraiter225, %.lr.ph107.split.prol.preheader ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv156, i64 %indvars.iv152.prol
  store double 0.000000e+00, double* %148, align 8
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv152.prol, i64 %indvars.iv156
  %150 = bitcast double* %149 to i64*
  store i64 0, i64* %150, align 8
  %indvars.iv.next153.prol = add nuw nsw i64 %indvars.iv152.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph107.split.prol.loopexit.loopexit, label %.lr.ph107.split.prol..lr.ph107.split.prol_crit_edge, !llvm.loop !8

.lr.ph107.split.prol..lr.ph107.split.prol_crit_edge: ; preds = %.lr.ph107.split.prol
  br label %.lr.ph107.split.prol

.lr.ph107.split.prol.loopexit.loopexit:           ; preds = %.lr.ph107.split.prol
  br label %.lr.ph107.split.prol.loopexit

.lr.ph107.split.prol.loopexit:                    ; preds = %.lr.ph107.split.preheader..lr.ph107.split.prol.loopexit_crit_edge, %.lr.ph107.split.prol.loopexit.loopexit
  %indvars.iv152.unr = phi i64 [ %indvars.iv150, %.lr.ph107.split.preheader..lr.ph107.split.prol.loopexit_crit_edge ], [ %indvars.iv.next153.prol, %.lr.ph107.split.prol.loopexit.loopexit ]
  %151 = icmp ult i64 %144, 3
  br i1 %151, label %.lr.ph107.split.prol.loopexit.._crit_edge93_crit_edge, label %.lr.ph107.split.preheader278

.lr.ph107.split.prol.loopexit.._crit_edge93_crit_edge: ; preds = %.lr.ph107.split.prol.loopexit
  br label %._crit_edge93

.lr.ph107.split.preheader278:                     ; preds = %.lr.ph107.split.prol.loopexit
  br label %.lr.ph107.split

.lr.ph107.split:                                  ; preds = %.lr.ph107.split..lr.ph107.split_crit_edge, %.lr.ph107.split.preheader278
  %indvars.iv152 = phi i64 [ %indvars.iv.next153.3, %.lr.ph107.split..lr.ph107.split_crit_edge ], [ %indvars.iv152.unr, %.lr.ph107.split.preheader278 ]
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv156, i64 %indvars.iv152
  store double 0.000000e+00, double* %152, align 8
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv152, i64 %indvars.iv156
  %154 = bitcast double* %153 to i64*
  store i64 0, i64* %154, align 8
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv156, i64 %indvars.iv.next153
  store double 0.000000e+00, double* %155, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next153, i64 %indvars.iv156
  %157 = bitcast double* %156 to i64*
  store i64 0, i64* %157, align 8
  %indvars.iv.next153.1 = add nsw i64 %indvars.iv152, 2
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv156, i64 %indvars.iv.next153.1
  store double 0.000000e+00, double* %158, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next153.1, i64 %indvars.iv156
  %160 = bitcast double* %159 to i64*
  store i64 0, i64* %160, align 8
  %indvars.iv.next153.2 = add nsw i64 %indvars.iv152, 3
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv156, i64 %indvars.iv.next153.2
  store double 0.000000e+00, double* %161, align 8
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next153.2, i64 %indvars.iv156
  %163 = bitcast double* %162 to i64*
  store i64 0, i64* %163, align 8
  %indvars.iv.next153.3 = add nsw i64 %indvars.iv152, 4
  %exitcond223.3 = icmp eq i64 %indvars.iv.next153.3, %113
  br i1 %exitcond223.3, label %._crit_edge93.loopexit, label %.lr.ph107.split..lr.ph107.split_crit_edge

.lr.ph107.split..lr.ph107.split_crit_edge:        ; preds = %.lr.ph107.split
  br label %.lr.ph107.split

._crit_edge93.loopexit:                           ; preds = %.lr.ph107.split
  br label %._crit_edge93

._crit_edge93:                                    ; preds = %.lr.ph107.split.prol.loopexit.._crit_edge93_crit_edge, %.lr.ph110.split.._crit_edge93_crit_edge, %._crit_edge93.loopexit
  %exitcond227 = icmp eq i64 %indvars.iv.next157, %116
  br i1 %exitcond227, label %._crit_edge93._crit_edge.loopexit279, label %._crit_edge93..lr.ph110.split_crit_edge

._crit_edge93..lr.ph110.split_crit_edge:          ; preds = %._crit_edge93
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  br label %.lr.ph110.split

._crit_edge93._crit_edge.loopexit:                ; preds = %._crit_edge93.us
  br label %._crit_edge93._crit_edge

._crit_edge93._crit_edge.loopexit279:             ; preds = %._crit_edge93
  br label %._crit_edge93._crit_edge

._crit_edge93._crit_edge:                         ; preds = %._crit_edge90.._crit_edge93_crit_edge.._crit_edge93._crit_edge_crit_edge, %._crit_edge93._crit_edge.loopexit279, %._crit_edge93._crit_edge.loopexit, %._crit_edge90.._crit_edge93_crit_edge.thread
  %164 = phi i32 [ %88, %._crit_edge90.._crit_edge93_crit_edge.thread ], [ %110, %._crit_edge90.._crit_edge93_crit_edge.._crit_edge93._crit_edge_crit_edge ], [ %110, %._crit_edge93._crit_edge.loopexit ], [ %110, %._crit_edge93._crit_edge.loopexit279 ]
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %165, i64 %165
  store double 1.000000e+00, double* %166, align 8
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
  br i1 %7, label %.._crit_edge10_crit_edge.us.preheader, label %.._crit_edge13_crit_edge

.._crit_edge13_crit_edge:                         ; preds = %2
  br label %._crit_edge13

.._crit_edge10_crit_edge.us.preheader:            ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %.._crit_edge10_crit_edge.us

.._crit_edge10_crit_edge.us:                      ; preds = %._crit_edge10._crit_edge.us..._crit_edge10_crit_edge.us_crit_edge, %.._crit_edge10_crit_edge.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.._crit_edge10_crit_edge.us.preheader ], [ %indvars.iv.next15, %._crit_edge10._crit_edge.us..._crit_edge10_crit_edge.us_crit_edge ]
  %10 = mul nsw i64 %indvars.iv14, %8
  br label %11

; <label>:11:                                     ; preds = %._crit_edge.us._crit_edge, %.._crit_edge10_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge10_crit_edge.us ], [ %indvars.iv.next, %._crit_edge.us._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %.._crit_edge.us_crit_edge

.._crit_edge.us_crit_edge:                        ; preds = %11
  br label %._crit_edge.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge.us_crit_edge, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond18, label %._crit_edge10._crit_edge.us, label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us
  br label %11

._crit_edge10._crit_edge.us:                      ; preds = %._crit_edge.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, %9
  br i1 %exitcond, label %._crit_edge13.loopexit, label %._crit_edge10._crit_edge.us..._crit_edge10_crit_edge.us_crit_edge

._crit_edge10._crit_edge.us..._crit_edge10_crit_edge.us_crit_edge: ; preds = %._crit_edge10._crit_edge.us
  br label %.._crit_edge10_crit_edge.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge10._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %._crit_edge13.loopexit
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !2}
