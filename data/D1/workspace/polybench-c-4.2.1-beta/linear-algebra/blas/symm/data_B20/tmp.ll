; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge17

._crit_edge17:                                    ; preds = %14
  br label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %._crit_edge17, %._crit_edge, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) #2 {
.preheader40.preheader:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader40

.preheader40:                                     ; preds = %._crit_edge50..preheader40_crit_edge, %.preheader40.preheader
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge50..preheader40_crit_edge ], [ 0, %.preheader40.preheader ]
  %7 = add nuw nsw i64 %indvars.iv69, 1200
  br label %8

; <label>:8:                                      ; preds = %._crit_edge82, %.preheader40
  %indvars.iv65 = phi i64 [ 0, %.preheader40 ], [ %indvars.iv.next66, %._crit_edge82 ]
  %9 = add nuw nsw i64 %indvars.iv65, %indvars.iv69
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 100
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.000000e+03
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv69, i64 %indvars.iv65
  store double %13, double* %14, align 8
  %15 = sub nuw nsw i64 %7, %indvars.iv65
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 100
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv69, i64 %indvars.iv65
  store double %19, double* %20, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, 1200
  br i1 %exitcond68, label %._crit_edge50, label %._crit_edge82

._crit_edge82:                                    ; preds = %8
  br label %8

._crit_edge50:                                    ; preds = %8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next70, 1000
  br i1 %exitcond71, label %.preheader.preheader, label %._crit_edge50..preheader40_crit_edge

._crit_edge50..preheader40_crit_edge:             ; preds = %._crit_edge50
  br label %.preheader40

.preheader.preheader:                             ; preds = %._crit_edge50
  br label %.preheader

.loopexit.loopexit:                               ; preds = %.lr.ph44.new
  br label %.loopexit

.loopexit:                                        ; preds = %middle.block..loopexit_crit_edge, %.prol.loopexit75..loopexit_crit_edge, %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
  %indvars.iv.next7379 = phi i64 [ %indvars.iv.next7380, %.prol.loopexit75..loopexit_crit_edge ], [ %indvars.iv.next73, %._crit_edge..loopexit_crit_edge ], [ %indvars.iv.next7380, %middle.block..loopexit_crit_edge ], [ %indvars.iv.next7380, %.loopexit.loopexit ]
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next7379, 1000
  br i1 %exitcond64, label %._crit_edge47, label %.loopexit..preheader_crit_edge

.loopexit..preheader_crit_edge:                   ; preds = %.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.loopexit..preheader_crit_edge, %.preheader.preheader
  %indvars.iv72 = phi i64 [ %indvars.iv.next7379, %.loopexit..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %.loopexit..preheader_crit_edge ], [ 1, %.preheader.preheader ]
  %21 = sub i64 999, %indvars.iv72
  %22 = sub i64 998, %indvars.iv72
  %23 = and i64 %indvars.iv72, 1
  %lcmp.mod = icmp eq i64 %23, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.preheader..prol.loopexit_crit_edge

.preheader..prol.loopexit_crit_edge:              ; preds = %.preheader
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader
  %24 = trunc i64 %indvars.iv72 to i32
  %25 = srem i32 %24, 100
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.000000e+03
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 0
  store double %27, double* %28, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader..prol.loopexit_crit_edge ]
  %29 = icmp eq i64 %indvars.iv72, 0
  br i1 %29, label %.prol.loopexit..lr.ph44_crit_edge, label %.preheader.new.preheader

.prol.loopexit..lr.ph44_crit_edge:                ; preds = %.prol.loopexit
  br label %.lr.ph44

.preheader.new.preheader:                         ; preds = %.prol.loopexit
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new..preheader.new_crit_edge, %.preheader.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.new..preheader.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.new.preheader ]
  %30 = add nuw nsw i64 %indvars.iv, %indvars.iv72
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 100
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 1.000000e+03
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv
  store double %34, double* %35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = add nuw nsw i64 %indvars.iv.next, %indvars.iv72
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 100
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 1.000000e+03
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv.next
  store double %40, double* %41, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv60
  br i1 %exitcond.1, label %._crit_edge, label %.preheader.new..preheader.new_crit_edge

.preheader.new..preheader.new_crit_edge:          ; preds = %.preheader.new
  br label %.preheader.new

._crit_edge:                                      ; preds = %.preheader.new
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %42 = icmp slt i64 %indvars.iv.next73, 1000
  br i1 %42, label %._crit_edge..lr.ph44_crit_edge, label %._crit_edge..loopexit_crit_edge

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit

._crit_edge..lr.ph44_crit_edge:                   ; preds = %._crit_edge
  br label %.lr.ph44

.lr.ph44:                                         ; preds = %._crit_edge..lr.ph44_crit_edge, %.prol.loopexit..lr.ph44_crit_edge
  %indvars.iv.next7380 = phi i64 [ %indvars.iv.next73, %._crit_edge..lr.ph44_crit_edge ], [ 1, %.prol.loopexit..lr.ph44_crit_edge ]
  %xtraiter76 = and i64 %21, 7
  %lcmp.mod77 = icmp eq i64 %xtraiter76, 0
  br i1 %lcmp.mod77, label %.lr.ph44..prol.loopexit75_crit_edge, label %.prol.preheader74.preheader

.lr.ph44..prol.loopexit75_crit_edge:              ; preds = %.lr.ph44
  br label %.prol.loopexit75

.prol.preheader74.preheader:                      ; preds = %.lr.ph44
  br label %.prol.preheader74

.prol.preheader74:                                ; preds = %.prol.preheader74..prol.preheader74_crit_edge, %.prol.preheader74.preheader
  %indvars.iv57.prol = phi i64 [ %indvars.iv.next58.prol, %.prol.preheader74..prol.preheader74_crit_edge ], [ %indvars.iv60, %.prol.preheader74.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader74..prol.preheader74_crit_edge ], [ %xtraiter76, %.prol.preheader74.preheader ]
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv57.prol
  store double -9.990000e+02, double* %43, align 8
  %indvars.iv.next58.prol = add nuw nsw i64 %indvars.iv57.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit75.loopexit, label %.prol.preheader74..prol.preheader74_crit_edge, !llvm.loop !1

.prol.preheader74..prol.preheader74_crit_edge:    ; preds = %.prol.preheader74
  br label %.prol.preheader74

.prol.loopexit75.loopexit:                        ; preds = %.prol.preheader74
  br label %.prol.loopexit75

.prol.loopexit75:                                 ; preds = %.lr.ph44..prol.loopexit75_crit_edge, %.prol.loopexit75.loopexit
  %indvars.iv57.unr = phi i64 [ %indvars.iv60, %.lr.ph44..prol.loopexit75_crit_edge ], [ %indvars.iv.next58.prol, %.prol.loopexit75.loopexit ]
  %44 = icmp ult i64 %22, 7
  br i1 %44, label %.prol.loopexit75..loopexit_crit_edge, label %.lr.ph44.new.preheader

.prol.loopexit75..loopexit_crit_edge:             ; preds = %.prol.loopexit75
  br label %.loopexit

.lr.ph44.new.preheader:                           ; preds = %.prol.loopexit75
  %45 = sub i64 992, %indvars.iv57.unr
  %46 = lshr i64 %45, 3
  %47 = add nuw nsw i64 %46, 1
  %min.iters.check = icmp ult i64 %47, 2
  br i1 %min.iters.check, label %.lr.ph44.new.preheader..lr.ph44.new.preheader81_crit_edge, label %min.iters.checked

.lr.ph44.new.preheader..lr.ph44.new.preheader81_crit_edge: ; preds = %.lr.ph44.new.preheader
  br label %.lr.ph44.new.preheader81

min.iters.checked:                                ; preds = %.lr.ph44.new.preheader
  %n.mod.vf = and i64 %47, 1
  %n.vec = sub nsw i64 %47, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %48 = add i64 %indvars.iv57.unr, 8
  %49 = shl nuw i64 %46, 3
  %50 = add i64 %48, %49
  %51 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %50, %51
  br i1 %cmp.zero, label %min.iters.checked..lr.ph44.new.preheader81_crit_edge, label %vector.body.preheader

min.iters.checked..lr.ph44.new.preheader81_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph44.new.preheader81

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %52 = shl i64 %index, 3
  %53 = add i64 %indvars.iv57.unr, %52
  %54 = add nsw i64 %53, 7
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %54
  %56 = getelementptr double, double* %55, i64 -7
  %57 = bitcast double* %56 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %57, align 8
  %index.next = add i64 %index, 2
  %58 = icmp eq i64 %index.next, %n.vec
  br i1 %58, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block..loopexit_crit_edge, label %middle.block..lr.ph44.new.preheader81_crit_edge

middle.block..lr.ph44.new.preheader81_crit_edge:  ; preds = %middle.block
  br label %.lr.ph44.new.preheader81

middle.block..loopexit_crit_edge:                 ; preds = %middle.block
  br label %.loopexit

.lr.ph44.new.preheader81:                         ; preds = %middle.block..lr.ph44.new.preheader81_crit_edge, %min.iters.checked..lr.ph44.new.preheader81_crit_edge, %.lr.ph44.new.preheader..lr.ph44.new.preheader81_crit_edge
  %indvars.iv57.ph = phi i64 [ %indvars.iv57.unr, %min.iters.checked..lr.ph44.new.preheader81_crit_edge ], [ %indvars.iv57.unr, %.lr.ph44.new.preheader..lr.ph44.new.preheader81_crit_edge ], [ %ind.end, %middle.block..lr.ph44.new.preheader81_crit_edge ]
  br label %.lr.ph44.new

.lr.ph44.new:                                     ; preds = %.lr.ph44.new..lr.ph44.new_crit_edge, %.lr.ph44.new.preheader81
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.7, %.lr.ph44.new..lr.ph44.new_crit_edge ], [ %indvars.iv57.ph, %.lr.ph44.new.preheader81 ]
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv57
  store double -9.990000e+02, double* %59, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv.next58
  store double -9.990000e+02, double* %60, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv.next58.1
  store double -9.990000e+02, double* %61, align 8
  %indvars.iv.next58.2 = add nsw i64 %indvars.iv57, 3
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv.next58.2
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next58.3 = add nsw i64 %indvars.iv57, 4
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv.next58.3
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next58.4 = add nsw i64 %indvars.iv57, 5
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv.next58.4
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next58.5 = add nsw i64 %indvars.iv57, 6
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv.next58.5
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next58.6 = add nsw i64 %indvars.iv57, 7
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv.next58.6
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next58.7 = add nsw i64 %indvars.iv57, 8
  %exitcond59.7 = icmp eq i64 %indvars.iv.next58.7, 1000
  br i1 %exitcond59.7, label %.loopexit.loopexit, label %.lr.ph44.new..lr.ph44.new_crit_edge, !llvm.loop !6

.lr.ph44.new..lr.ph44.new_crit_edge:              ; preds = %.lr.ph44.new
  br label %.lr.ph44.new

._crit_edge47:                                    ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]* readonly, [1200 x double]* readonly) #2 {
.preheader44.preheader:
  %7 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert81 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat82 = shufflevector <2 x double> %broadcast.splatinsert81, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert85 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat86 = shufflevector <2 x double> %broadcast.splatinsert85, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert87 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat88 = shufflevector <2 x double> %broadcast.splatinsert87, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge51..preheader44_crit_edge, %.preheader44.preheader
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge51..preheader44_crit_edge ], [ 0, %.preheader44.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv61, i64 0
  %8 = add i64 %indvars.iv61, 1
  %scevgep69 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %9 = icmp sgt i64 %indvars.iv61, 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %indvars.iv61
  br i1 %9, label %.preheader.us.preheader, label %vector.memcheck

.preheader.us.preheader:                          ; preds = %.preheader44
  br label %.preheader.us

vector.memcheck:                                  ; preds = %.preheader44
  %scevgep73 = getelementptr [1200 x double], [1200 x double]* %6, i64 %8, i64 0
  %scevgep71 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv61, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep73
  %bound1 = icmp ult double* %scevgep71, %scevgep69
  %found.conflict = and i1 %bound0, %bound1
  %bound076 = icmp ult double* %scevgep, %10
  %bound177 = icmp ult double* %10, %scevgep69
  %found.conflict78 = and i1 %bound076, %bound177
  %conflict.rdx = or i1 %found.conflict, %found.conflict78
  br i1 %conflict.rdx, label %.preheader.preheader, label %vector.ph

.preheader.preheader:                             ; preds = %vector.memcheck
  br label %.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv61, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !8, !noalias !11
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !8, !noalias !11
  %15 = fmul <2 x double> %wide.load, %broadcast.splat82
  %16 = fmul <2 x double> %wide.load80, %broadcast.splat82
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv61, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !14
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !14
  %21 = fmul <2 x double> %wide.load83, %broadcast.splat86
  %22 = fmul <2 x double> %wide.load84, %broadcast.splat86
  %23 = load double, double* %10, align 8, !alias.scope !15
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = insertelement <2 x double> undef, double %23, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = fmul <2 x double> %21, %25
  %29 = fmul <2 x double> %22, %27
  %30 = fadd <2 x double> %15, %28
  %31 = fadd <2 x double> %16, %29
  %32 = fadd <2 x double> %broadcast.splat88, %30
  %33 = fadd <2 x double> %broadcast.splat88, %31
  %34 = bitcast double* %11 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !8, !noalias !11
  %35 = bitcast double* %13 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, 1200
  br i1 %36, label %._crit_edge51.loopexit90, label %vector.body.vector.body_crit_edge, !llvm.loop !16

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv55.us = phi i64 [ %indvars.iv.next56.us, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv61, i64 %indvars.iv55.us
  br label %38

; <label>:38:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %.047.us = phi double [ 0.000000e+00, %.preheader.us ], [ %51, %._crit_edge ]
  %39 = load double, double* %37, align 8
  %40 = fmul double %39, %2
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %indvars.iv.us
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.us, i64 %indvars.iv55.us
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv.us, i64 %indvars.iv55.us
  %48 = load double, double* %47, align 8
  %49 = load double, double* %41, align 8
  %50 = fmul double %48, %49
  %51 = fadd double %.047.us, %50
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next.us, %indvars.iv61
  br i1 %exitcond60, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %38
  br label %38

._crit_edge.us:                                   ; preds = %38
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv61, i64 %indvars.iv55.us
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %3
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv61, i64 %indvars.iv55.us
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %2
  %58 = load double, double* %10, align 8
  %59 = fmul double %57, %58
  %60 = fadd double %54, %59
  %61 = fmul double %51, %2
  %62 = fadd double %61, %60
  store double %62, double* %52, align 8
  %indvars.iv.next56.us = add nuw nsw i64 %indvars.iv55.us, 1
  %exitcond57.us = icmp eq i64 %indvars.iv.next56.us, 1200
  br i1 %exitcond57.us, label %._crit_edge51.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader
  %indvars.iv55 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next56.1, %.preheader..preheader_crit_edge ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv61, i64 %indvars.iv55
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv61, i64 %indvars.iv55
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %2
  %69 = load double, double* %10, align 8
  %70 = fmul double %68, %69
  %71 = fadd double %65, %70
  %72 = fadd double %7, %71
  store double %72, double* %63, align 8
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv61, i64 %indvars.iv.next56
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %3
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv61, i64 %indvars.iv.next56
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, %2
  %79 = load double, double* %10, align 8
  %80 = fmul double %78, %79
  %81 = fadd double %75, %80
  %82 = fadd double %7, %81
  store double %82, double* %73, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next56.1, 1200
  br i1 %exitcond57.1, label %._crit_edge51.loopexit89, label %.preheader..preheader_crit_edge, !llvm.loop !17

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  br label %.preheader

._crit_edge51.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge51

._crit_edge51.loopexit89:                         ; preds = %.preheader
  br label %._crit_edge51

._crit_edge51.loopexit90:                         ; preds = %vector.body
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit90, %._crit_edge51.loopexit89, %._crit_edge51.loopexit
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next62, 1000
  br i1 %exitcond63, label %._crit_edge54, label %._crit_edge51..preheader44_crit_edge

._crit_edge51..preheader44_crit_edge:             ; preds = %._crit_edge51
  br label %.preheader44

._crit_edge54:                                    ; preds = %._crit_edge51
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readonly) #0 {
.preheader.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge..preheader_crit_edge, %.preheader.preheader
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %7 = mul nuw nsw i64 %indvars.iv15, 1000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge19, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge19 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge18

._crit_edge18:                                    ; preds = %8
  br label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %._crit_edge18, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge19

._crit_edge19:                                    ; preds = %15
  br label %8

._crit_edge:                                      ; preds = %15
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %._crit_edge14, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  br label %.preheader

._crit_edge14:                                    ; preds = %._crit_edge
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
