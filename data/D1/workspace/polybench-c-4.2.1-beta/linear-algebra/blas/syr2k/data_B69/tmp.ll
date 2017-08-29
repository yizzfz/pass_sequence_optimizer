; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge16

._crit_edge16:                                    ; preds = %14
  br label %18

; <label>:17:                                     ; preds = %14
  tail call void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %._crit_edge16, %._crit_edge, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
.preheader26.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader26.us

.preheader26.us:                                  ; preds = %._crit_edge33.us..preheader26.us_crit_edge, %.preheader26.lr.ph
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge33.us..preheader26.us_crit_edge ], [ 0, %.preheader26.lr.ph ]
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader26.us
  %indvars.iv41 = phi i64 [ 0, %.preheader26.us ], [ %indvars.iv.next42, %._crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv41, %indvars.iv45
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 1200
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.200000e+03
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 %indvars.iv41
  store double %13, double* %14, align 8
  %15 = add nuw nsw i64 %8, 2
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 1000
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv45, i64 %indvars.iv41
  store double %19, double* %20, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 1000
  br i1 %exitcond44, label %._crit_edge33.us, label %._crit_edge

._crit_edge:                                      ; preds = %7
  br label %7

._crit_edge33.us:                                 ; preds = %7
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond48, label %._crit_edge33.us..preheader.us_crit_edge, label %._crit_edge33.us..preheader26.us_crit_edge

._crit_edge33.us..preheader26.us_crit_edge:       ; preds = %._crit_edge33.us
  br label %.preheader26.us

._crit_edge33.us..preheader.us_crit_edge:         ; preds = %._crit_edge33.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %._crit_edge33.us..preheader.us_crit_edge
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %._crit_edge33.us..preheader.us_crit_edge ]
  br label %21

; <label>:21:                                     ; preds = %._crit_edge51, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge51 ]
  %22 = mul nuw nsw i64 %indvars.iv, %indvars.iv37
  %23 = add nuw nsw i64 %22, 3
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 1200
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.000000e+03
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge51

._crit_edge51:                                    ; preds = %21
  br label %21

._crit_edge.us:                                   ; preds = %21
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1200
  br i1 %exitcond40, label %._crit_edge30, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge30:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
.preheader32.lr.ph:
  %broadcast.splatinsert112 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat113 = shufflevector <2 x double> %broadcast.splatinsert112, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert133 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat134 = shufflevector <2 x double> %broadcast.splatinsert133, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader136, %.lr.ph.us.new..lr.ph.us.new_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader136 ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %3
  store double %9, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next.1
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next.2
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv63
  br i1 %exitcond.3, label %.lr.ph.us.new..preheader.us43_crit_edge, label %.lr.ph.us.new..lr.ph.us.new_crit_edge, !llvm.loop !1

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.lr.ph.us.new..preheader.us43_crit_edge:          ; preds = %.lr.ph.us.new
  br label %.preheader.us43.preheader

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph.scalar.ph_crit_edge
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv53.ph, %scalar.ph.preheader ]
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv58
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %2
  %22 = load double, double* %34, align 8
  %23 = fmul double %21, %22
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv53, i64 %indvars.iv58
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %2
  %27 = load double, double* %35, align 8
  %28 = fmul double %26, %27
  %29 = fadd double %23, %28
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv53
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %29
  store double %32, double* %30, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond = icmp eq i64 %indvars.iv.next54, %indvars.iv63
  br i1 %exitcond, label %scalar.ph.._crit_edge.us46_crit_edge, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !5

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

scalar.ph.._crit_edge.us46_crit_edge:             ; preds = %scalar.ph
  br label %._crit_edge.us46

.preheader.us43:                                  ; preds = %.preheader.us43.preheader, %._crit_edge.us46..preheader.us43_crit_edge
  %indvars.iv58 = phi i64 [ %33, %._crit_edge.us46..preheader.us43_crit_edge ], [ 0, %.preheader.us43.preheader ]
  %scevgep90 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv58
  %33 = add i64 %indvars.iv58, 1
  %scevgep92 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %33
  %scevgep94 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv58
  %scevgep96 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv65, i64 %33
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv58
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv58
  br i1 %min.iters.check, label %.preheader.us43.scalar.ph_crit_edge, label %min.iters.checked

.preheader.us43.scalar.ph_crit_edge:              ; preds = %.preheader.us43
  br label %scalar.ph.preheader

min.iters.checked:                                ; preds = %.preheader.us43
  br i1 %cmp.zero, label %min.iters.checked.scalar.ph_crit_edge, label %vector.memcheck

min.iters.checked.scalar.ph_crit_edge:            ; preds = %min.iters.checked
  br label %scalar.ph.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %35
  %bound1 = icmp ult double* %35, %scevgep88
  %found.conflict = and i1 %bound0, %bound1
  %bound099 = icmp ult double* %scevgep, %scevgep92
  %bound1100 = icmp ult double* %scevgep90, %scevgep88
  %found.conflict101 = and i1 %bound099, %bound1100
  %conflict.rdx = or i1 %found.conflict, %found.conflict101
  %bound0102 = icmp ult double* %scevgep, %scevgep96
  %bound1103 = icmp ult double* %scevgep94, %scevgep88
  %found.conflict104 = and i1 %bound0102, %bound1103
  %conflict.rdx105 = or i1 %conflict.rdx, %found.conflict104
  %bound0108 = icmp ult double* %scevgep, %34
  %bound1109 = icmp ult double* %34, %scevgep88
  %found.conflict110 = and i1 %bound0108, %bound1109
  %conflict.rdx111 = or i1 %conflict.rdx105, %found.conflict110
  br i1 %conflict.rdx111, label %vector.memcheck.scalar.ph_crit_edge, label %vector.ph

vector.memcheck.scalar.ph_crit_edge:              ; preds = %vector.memcheck
  br label %scalar.ph.preheader

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %34, align 8, !alias.scope !6
  %.pre135 = load double, double* %35, align 8, !alias.scope !9
  %36 = insertelement <2 x double> undef, double %.pre, i32 0
  %37 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> zeroinitializer
  %38 = insertelement <2 x double> undef, double %.pre135, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %40 = or i64 %index, 1
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv58
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %40, i64 %indvars.iv58
  %43 = load double, double* %41, align 8, !alias.scope !11
  %44 = load double, double* %42, align 8, !alias.scope !11
  %45 = insertelement <2 x double> undef, double %43, i32 0
  %46 = insertelement <2 x double> %45, double %44, i32 1
  %47 = fmul <2 x double> %46, %broadcast.splat113
  %48 = fmul <2 x double> %47, %37
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv58
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %40, i64 %indvars.iv58
  %51 = load double, double* %49, align 8, !alias.scope !13
  %52 = load double, double* %50, align 8, !alias.scope !13
  %53 = insertelement <2 x double> undef, double %51, i32 0
  %54 = insertelement <2 x double> %53, double %52, i32 1
  %55 = fmul <2 x double> %54, %broadcast.splat113
  %56 = fmul <2 x double> %55, %39
  %57 = fadd <2 x double> %48, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %index
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !15, !noalias !17
  %60 = fadd <2 x double> %wide.load, %57
  store <2 x double> %60, <2 x double>* %59, align 8, !alias.scope !15, !noalias !17
  %index.next = add i64 %index, 2
  %61 = icmp eq i64 %index.next, %n.vec
  br i1 %61, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !18

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge.us46_crit_edge, label %middle.block.scalar.ph_crit_edge

middle.block.scalar.ph_crit_edge:                 ; preds = %middle.block
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader.us43.scalar.ph_crit_edge, %min.iters.checked.scalar.ph_crit_edge, %vector.memcheck.scalar.ph_crit_edge, %middle.block.scalar.ph_crit_edge
  %indvars.iv53.ph = phi i64 [ 0, %vector.memcheck.scalar.ph_crit_edge ], [ 0, %min.iters.checked.scalar.ph_crit_edge ], [ 0, %.preheader.us43.scalar.ph_crit_edge ], [ %n.vec, %middle.block.scalar.ph_crit_edge ]
  br label %scalar.ph

middle.block.._crit_edge.us46_crit_edge:          ; preds = %middle.block
  br label %._crit_edge.us46

.lr.ph.us:                                        ; preds = %._crit_edge37.us..lr.ph.us_crit_edge, %.preheader32.lr.ph
  %indvars.iv137 = phi i2 [ %indvars.iv.next138, %._crit_edge37.us..lr.ph.us_crit_edge ], [ 1, %.preheader32.lr.ph ]
  %indvars.iv65 = phi i64 [ %69, %._crit_edge37.us..lr.ph.us_crit_edge ], [ 0, %.preheader32.lr.ph ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge37.us..lr.ph.us_crit_edge ], [ 1, %.preheader32.lr.ph ]
  %62 = zext i2 %indvars.iv137 to i64
  %63 = add nuw nsw i64 %62, 4294967295
  %64 = and i64 %63, 4294967295
  %65 = add nuw nsw i64 %64, 1
  %66 = add i64 %indvars.iv65, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 0
  %67 = mul i64 %indvars.iv65, 1201
  %68 = add i64 %67, 1
  %scevgep88 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %68
  %69 = add i64 %indvars.iv65, 1
  %70 = trunc i64 %69 to i32
  %xtraiter = and i32 %70, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.lr.ph.us..prol.preheader_crit_edge

.lr.ph.us..prol.preheader_crit_edge:              ; preds = %.lr.ph.us
  br label %.prol.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.lr.ph.us..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.lr.ph.us..prol.preheader_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.lr.ph.us..prol.preheader_crit_edge ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.prol
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %3
  store double %73, double* %71, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.preheader..prol.loopexit_crit_edge, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !19

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader

.prol.preheader..prol.loopexit_crit_edge:         ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader..prol.loopexit_crit_edge, %.lr.ph.us..prol.loopexit_crit_edge
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us..prol.loopexit_crit_edge ], [ %65, %.prol.preheader..prol.loopexit_crit_edge ]
  %74 = icmp ult i64 %indvars.iv65, 3
  br i1 %74, label %.prol.loopexit..preheader.us43_crit_edge, label %.lr.ph.us.new.preheader

.prol.loopexit..preheader.us43_crit_edge:         ; preds = %.prol.loopexit
  br label %.preheader.us43.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %75 = sub i64 %66, %indvars.iv.unr
  %76 = lshr i64 %75, 2
  %77 = add nuw nsw i64 %76, 1
  %min.iters.check117 = icmp ult i64 %77, 2
  br i1 %min.iters.check117, label %.lr.ph.us.new.preheader..lr.ph.us.new_crit_edge, label %min.iters.checked118

.lr.ph.us.new.preheader..lr.ph.us.new_crit_edge:  ; preds = %.lr.ph.us.new.preheader
  br label %.lr.ph.us.new.preheader136

min.iters.checked118:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf119 = and i64 %77, 1
  %n.vec120 = sub nsw i64 %77, %n.mod.vf119
  %cmp.zero121 = icmp eq i64 %n.vec120, 0
  %78 = add nsw i64 %indvars.iv.unr, 4
  %79 = shl nuw i64 %76, 2
  %80 = add i64 %78, %79
  %81 = shl nuw nsw i64 %n.mod.vf119, 2
  %ind.end = sub i64 %80, %81
  br i1 %cmp.zero121, label %min.iters.checked118..lr.ph.us.new_crit_edge, label %vector.ph122

min.iters.checked118..lr.ph.us.new_crit_edge:     ; preds = %min.iters.checked118
  br label %.lr.ph.us.new.preheader136

vector.ph122:                                     ; preds = %min.iters.checked118
  br label %vector.body114

vector.body114:                                   ; preds = %vector.body114.vector.body114_crit_edge, %vector.ph122
  %index123 = phi i64 [ 0, %vector.ph122 ], [ %index.next124, %vector.body114.vector.body114_crit_edge ]
  %82 = shl i64 %index123, 2
  %offset.idx = add i64 %indvars.iv.unr, %82
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %offset.idx
  %84 = bitcast double* %83 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %84, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec130 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec131 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec132 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %85 = fmul <2 x double> %strided.vec, %broadcast.splat134
  %86 = fmul <2 x double> %strided.vec130, %broadcast.splat134
  %87 = fmul <2 x double> %strided.vec131, %broadcast.splat134
  %88 = add nsw i64 %offset.idx, 3
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %88
  %90 = fmul <2 x double> %strided.vec132, %broadcast.splat134
  %91 = getelementptr double, double* %89, i64 -3
  %92 = bitcast double* %91 to <8 x double>*
  %93 = shufflevector <2 x double> %85, <2 x double> %86, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %94 = shufflevector <2 x double> %87, <2 x double> %90, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %93, <4 x double> %94, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %92, align 8
  %index.next124 = add i64 %index123, 2
  %95 = icmp eq i64 %index.next124, %n.vec120
  br i1 %95, label %middle.block115, label %vector.body114.vector.body114_crit_edge, !llvm.loop !21

vector.body114.vector.body114_crit_edge:          ; preds = %vector.body114
  br label %vector.body114

middle.block115:                                  ; preds = %vector.body114
  %cmp.n126 = icmp eq i64 %n.mod.vf119, 0
  br i1 %cmp.n126, label %middle.block115..preheader.us43_crit_edge, label %middle.block115..lr.ph.us.new_crit_edge

middle.block115..lr.ph.us.new_crit_edge:          ; preds = %middle.block115
  br label %.lr.ph.us.new.preheader136

.lr.ph.us.new.preheader136:                       ; preds = %.lr.ph.us.new.preheader..lr.ph.us.new_crit_edge, %min.iters.checked118..lr.ph.us.new_crit_edge, %middle.block115..lr.ph.us.new_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked118..lr.ph.us.new_crit_edge ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader..lr.ph.us.new_crit_edge ], [ %ind.end, %middle.block115..lr.ph.us.new_crit_edge ]
  br label %.lr.ph.us.new

middle.block115..preheader.us43_crit_edge:        ; preds = %middle.block115
  br label %.preheader.us43.preheader

.preheader.us43.preheader:                        ; preds = %.lr.ph.us.new..preheader.us43_crit_edge, %.prol.loopexit..preheader.us43_crit_edge, %middle.block115..preheader.us43_crit_edge
  %min.iters.check = icmp ult i64 %69, 2
  %n.vec = and i64 %69, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %69, %n.vec
  br label %.preheader.us43

._crit_edge.us46:                                 ; preds = %middle.block.._crit_edge.us46_crit_edge, %scalar.ph.._crit_edge.us46_crit_edge
  %exitcond61 = icmp eq i64 %33, 1000
  br i1 %exitcond61, label %._crit_edge37.us, label %._crit_edge.us46..preheader.us43_crit_edge

._crit_edge.us46..preheader.us43_crit_edge:       ; preds = %._crit_edge.us46
  br label %.preheader.us43

._crit_edge37.us:                                 ; preds = %._crit_edge.us46
  %exitcond68 = icmp eq i64 %69, 1200
  br i1 %exitcond68, label %._crit_edge41, label %._crit_edge37.us..lr.ph.us_crit_edge

._crit_edge37.us..lr.ph.us_crit_edge:             ; preds = %._crit_edge37.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %indvars.iv.next138 = add i2 %indvars.iv137, 1
  br label %.lr.ph.us

._crit_edge41:                                    ; preds = %._crit_edge37.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us..preheader.us_crit_edge ]
  %6 = mul nsw i64 %indvars.iv12, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge16, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge16 ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %7
  br label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge16

._crit_edge16:                                    ; preds = %14
  br label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond15, label %._crit_edge11, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !3, !4}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!10, !12, !14, !7}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
