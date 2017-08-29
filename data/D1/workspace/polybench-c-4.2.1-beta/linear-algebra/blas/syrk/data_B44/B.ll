; ModuleID = 'A.ll'
source_filename = "syrk.c"
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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  tail call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader4

.preheader4:                                      ; preds = %15, %6
  %indvars.iv15 = phi i64 [ 0, %6 ], [ %indvars.iv.next16, %15 ]
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader4
  %indvars.iv12 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next13, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv12, %indvars.iv15
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 1200
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.200000e+03
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv15, i64 %indvars.iv12
  store double %13, double* %14, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond14, label %15, label %7

; <label>:15:                                     ; preds = %7
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %.preheader.preheader, label %.preheader4

.preheader.preheader:                             ; preds = %15
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %24
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %24 ], [ 0, %.preheader.preheader ]
  br label %16

; <label>:16:                                     ; preds = %16, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %16 ]
  %17 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %18 = add nuw nsw i64 %17, 2
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 1000
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, 1.000000e+03
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv9, i64 %indvars.iv
  store double %22, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %24, label %16

; <label>:24:                                     ; preds = %16
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond11, label %25, label %.preheader

; <label>:25:                                     ; preds = %24
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %broadcast.splatinsert38 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat39 = shufflevector <2 x double> %broadcast.splatinsert38, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph:                                           ; preds = %.us-lcssa.us..lr.ph_crit_edge, %6
  %indvars.iv33 = phi i2 [ 1, %6 ], [ %indvars.iv.next34, %.us-lcssa.us..lr.ph_crit_edge ]
  %indvars.iv29 = phi i64 [ 0, %6 ], [ %indvars.iv.next30, %.us-lcssa.us..lr.ph_crit_edge ]
  %indvars.iv27 = phi i64 [ 1, %6 ], [ %indvars.iv.next28, %.us-lcssa.us..lr.ph_crit_edge ]
  %7 = add i64 %indvars.iv29, -3
  %8 = zext i2 %indvars.iv33 to i64
  %9 = add nuw nsw i64 %8, 4294967295
  %10 = and i64 %9, 4294967295
  %11 = add nuw nsw i64 %10, 1
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %12 = trunc i64 %indvars.iv.next30 to i32
  %xtraiter = and i32 %12, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv.prol
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %11, %.prol.loopexit.loopexit ]
  %16 = icmp ult i64 %indvars.iv29, 3
  br i1 %16, label %.preheader.preheader, label %.prol.loopexit..lr.ph.new_crit_edge

.prol.loopexit..lr.ph.new_crit_edge:              ; preds = %.prol.loopexit
  %17 = sub i64 %7, %indvars.iv.unr
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check = icmp ult i64 %19, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.prol.loopexit..lr.ph.new_crit_edge
  %n.mod.vf = and i64 %19, 1
  %n.vec = sub nsw i64 %19, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %20 = add nsw i64 %indvars.iv.unr, 4
  %21 = shl nuw i64 %18, 2
  %22 = add i64 %20, %21
  %23 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %22, %23
  br i1 %cmp.zero, label %.lr.ph.new.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %24 = shl i64 %index, 2
  %25 = add i64 %indvars.iv.unr, %24
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %25
  %27 = bitcast double* %26 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %27, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec35 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec36 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec37 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %28 = fmul <2 x double> %strided.vec, %broadcast.splat39
  %29 = fmul <2 x double> %strided.vec35, %broadcast.splat39
  %30 = fmul <2 x double> %strided.vec36, %broadcast.splat39
  %31 = add nsw i64 %25, 3
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %31
  %33 = fmul <2 x double> %strided.vec37, %broadcast.splat39
  %34 = getelementptr double, double* %32, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  %36 = shufflevector <2 x double> %28, <2 x double> %29, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %37 = shufflevector <2 x double> %30, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %36, <4 x double> %37, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %35, align 8
  %index.next = add i64 %index, 2
  %38 = icmp eq i64 %index.next, %n.vec
  br i1 %38, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %middle.block, %min.iters.checked, %.prol.loopexit..lr.ph.new_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.prol.loopexit..lr.ph.new_crit_edge ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.ph, %.lr.ph.new.preheader ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %3
  store double %41, double* %39, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %3
  store double %44, double* %42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv.next.1
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %3
  store double %47, double* %45, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv.next.2
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %3
  store double %50, double* %48, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv27
  br i1 %exitcond.3, label %.preheader.preheader.loopexit, label %.lr.ph.new, !llvm.loop !6

.preheader.preheader.loopexit:                    ; preds = %.lr.ph.new
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %middle.block, %.prol.loopexit
  %xtraiter2132 = and i64 %indvars.iv.next30, 1
  %lcmp.mod22 = icmp eq i64 %xtraiter2132, 0
  %51 = icmp eq i64 %indvars.iv29, 0
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 0
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge ], [ 0, %.preheader.preheader ]
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %indvars.iv24
  br i1 %lcmp.mod22, label %.prol.loopexit20, label %.prol.preheader19

.prol.preheader19:                                ; preds = %.preheader
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %2
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv24
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = load double, double* %52, align 8
  %60 = fadd double %59, %58
  store double %60, double* %52, align 8
  br label %.prol.loopexit20

.prol.loopexit20:                                 ; preds = %.preheader, %.prol.preheader19
  %indvars.iv14.unr.ph = phi i64 [ 1, %.prol.preheader19 ], [ 0, %.preheader ]
  br i1 %51, label %._crit_edge, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit20
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new.preheader, %.preheader.new
  %indvars.iv14 = phi i64 [ %indvars.iv.next15.1, %.preheader.new ], [ %indvars.iv14.unr.ph, %.preheader.new.preheader ]
  %61 = load double, double* %53, align 8
  %62 = fmul double %61, %2
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %indvars.iv24
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv14
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %69 = load double, double* %53, align 8
  %70 = fmul double %69, %2
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next15, i64 %indvars.iv24
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv.next15
  %75 = load double, double* %74, align 8
  %76 = fadd double %75, %73
  store double %76, double* %74, align 8
  %indvars.iv.next15.1 = add nuw nsw i64 %indvars.iv14, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next15.1, %indvars.iv27
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.preheader.new

._crit_edge.loopexit:                             ; preds = %.preheader.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit20
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond, label %.us-lcssa.us, label %.preheader

.us-lcssa.us:                                     ; preds = %._crit_edge
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 1200
  br i1 %exitcond31, label %77, label %.us-lcssa.us..lr.ph_crit_edge

.us-lcssa.us..lr.ph_crit_edge:                    ; preds = %.us-lcssa.us
  %indvars.iv.next34 = add i2 %indvars.iv33, 1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  br label %.lr.ph

; <label>:77:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %19, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %8

; <label>:8:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
