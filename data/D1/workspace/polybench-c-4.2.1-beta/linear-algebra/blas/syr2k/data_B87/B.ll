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
  call void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call void @kernel_syr2k(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  br i1 %16, label %17, label %.._crit_edge_crit_edge12

.._crit_edge_crit_edge12:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call void @print_array([1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge12, %.._crit_edge_crit_edge, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
.preheader5.us.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge12.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv24 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next25, %._crit_edge12.us..preheader5.us_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader5.us
  %indvars.iv20 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next21, %._crit_edge.._crit_edge_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv20, %indvars.iv24
  %6 = add nuw nsw i64 %5, 1
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1200
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.200000e+03
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv20
  store double %10, double* %11, align 8
  %12 = add nuw nsw i64 %5, 2
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 1000
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.000000e+03
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv20
  store double %16, double* %17, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond23, label %._crit_edge12.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge12.us:                                 ; preds = %._crit_edge
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond27, label %.preheader.us.preheader, label %._crit_edge12.us..preheader5.us_crit_edge

._crit_edge12.us..preheader5.us_crit_edge:        ; preds = %._crit_edge12.us
  br label %.preheader5.us

.preheader.us.preheader:                          ; preds = %._crit_edge12.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.._crit_edge29_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge29.._crit_edge29_crit_edge ]
  %18 = mul nuw nsw i64 %indvars.iv, %indvars.iv16
  %19 = add nuw nsw i64 %18, 3
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1200
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 1.000000e+03
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  store double %23, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge29.._crit_edge29_crit_edge

._crit_edge29.._crit_edge29_crit_edge:            ; preds = %._crit_edge29
  br label %._crit_edge29

._crit_edge.us:                                   ; preds = %._crit_edge29
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond19, label %._crit_edge9, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
.preheader5.us.preheader:
  %broadcast.splatinsert26 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat27 = shufflevector <2 x double> %broadcast.splatinsert26, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert47 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat48 = shufflevector <2 x double> %broadcast.splatinsert47, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.._crit_edge_crit_edge ], [ %indvars.iv.ph, %._crit_edge.preheader ]
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv
  %6 = load double, double* %5, align 8
  %7 = fmul double %6, %1
  store double %7, double* %5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv37
  br i1 %exitcond, label %.preheader.us16.preheader.loopexit, label %._crit_edge.._crit_edge_crit_edge, !llvm.loop !1

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge54:                                    ; preds = %._crit_edge54.._crit_edge54_crit_edge, %._crit_edge54.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge54.._crit_edge54_crit_edge ], [ %indvars.iv26.ph, %._crit_edge54.preheader ]
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv32
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %0
  %11 = load double, double* %23, align 8
  %12 = fmul double %10, %11
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv32
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %0
  %16 = load double, double* %24, align 8
  %17 = fmul double %15, %16
  %18 = fadd double %12, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv26
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %19, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next27, %indvars.iv37
  br i1 %exitcond31, label %._crit_edge.us19.loopexit, label %._crit_edge54.._crit_edge54_crit_edge, !llvm.loop !5

._crit_edge54.._crit_edge54_crit_edge:            ; preds = %._crit_edge54
  br label %._crit_edge54

.preheader.us16:                                  ; preds = %._crit_edge.us19..preheader.us16_crit_edge, %.preheader.us16.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us19..preheader.us16_crit_edge ], [ 0, %.preheader.us16.preheader ]
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv32
  %22 = add nuw nsw i64 %indvars.iv32, 1
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %22
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %4, i64 0, i64 %indvars.iv32
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %22
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv32
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv32
  br i1 %min.iters.check, label %.preheader.us16.._crit_edge54.preheader_crit_edge, label %min.iters.checked

.preheader.us16.._crit_edge54.preheader_crit_edge: ; preds = %.preheader.us16
  br label %._crit_edge54.preheader

._crit_edge54.preheader:                          ; preds = %middle.block.._crit_edge54.preheader_crit_edge, %vector.memcheck.._crit_edge54.preheader_crit_edge, %min.iters.checked.._crit_edge54.preheader_crit_edge, %.preheader.us16.._crit_edge54.preheader_crit_edge
  %indvars.iv26.ph = phi i64 [ 0, %vector.memcheck.._crit_edge54.preheader_crit_edge ], [ 0, %min.iters.checked.._crit_edge54.preheader_crit_edge ], [ 0, %.preheader.us16.._crit_edge54.preheader_crit_edge ], [ %n.vec, %middle.block.._crit_edge54.preheader_crit_edge ]
  br label %._crit_edge54

min.iters.checked:                                ; preds = %.preheader.us16
  br i1 %cmp.zero, label %min.iters.checked.._crit_edge54.preheader_crit_edge, label %vector.memcheck

min.iters.checked.._crit_edge54.preheader_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge54.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %24
  %bound1 = icmp ult double* %24, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep, %scevgep6
  %bound114 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %bound016 = icmp ult double* %scevgep, %scevgep10
  %bound117 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx19 = or i1 %conflict.rdx, %found.conflict18
  %bound022 = icmp ult double* %scevgep, %23
  %bound123 = icmp ult double* %23, %scevgep2
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx25 = or i1 %conflict.rdx19, %found.conflict24
  br i1 %conflict.rdx25, label %vector.memcheck.._crit_edge54.preheader_crit_edge, label %vector.ph

vector.memcheck.._crit_edge54.preheader_crit_edge: ; preds = %vector.memcheck
  br label %._crit_edge54.preheader

vector.ph:                                        ; preds = %vector.memcheck
  %25 = load double, double* %23, align 8, !alias.scope !6
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = load double, double* %24, align 8, !alias.scope !9
  %29 = insertelement <2 x double> undef, double %28, i32 0
  %30 = shufflevector <2 x double> %29, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %31 = or i64 %index, 1
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %index, i64 %indvars.iv32
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %31, i64 %indvars.iv32
  %34 = load double, double* %32, align 8, !alias.scope !11
  %35 = load double, double* %33, align 8, !alias.scope !11
  %36 = insertelement <2 x double> undef, double %34, i32 0
  %37 = insertelement <2 x double> %36, double %35, i32 1
  %38 = fmul <2 x double> %37, %broadcast.splat27
  %39 = fmul <2 x double> %38, %27
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %index, i64 %indvars.iv32
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %31, i64 %indvars.iv32
  %42 = load double, double* %40, align 8, !alias.scope !13
  %43 = load double, double* %41, align 8, !alias.scope !13
  %44 = insertelement <2 x double> undef, double %42, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  %46 = fmul <2 x double> %45, %broadcast.splat27
  %47 = fmul <2 x double> %46, %30
  %48 = fadd <2 x double> %39, %47
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %index
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !15, !noalias !17
  %51 = fadd <2 x double> %wide.load, %48
  %52 = bitcast double* %49 to <2 x double>*
  store <2 x double> %51, <2 x double>* %52, align 8, !alias.scope !15, !noalias !17
  %index.next = add i64 %index, 2
  %53 = icmp eq i64 %index.next, %n.vec
  br i1 %53, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !18

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge.us19_crit_edge, label %middle.block.._crit_edge54.preheader_crit_edge

middle.block.._crit_edge54.preheader_crit_edge:   ; preds = %middle.block
  br label %._crit_edge54.preheader

middle.block.._crit_edge.us19_crit_edge:          ; preds = %middle.block
  br label %._crit_edge.us19

.lr.ph.us:                                        ; preds = %._crit_edge10.us..lr.ph.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv39 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next40, %._crit_edge10.us..lr.ph.us_crit_edge ]
  %indvars.iv37 = phi i64 [ 1, %.preheader5.us.preheader ], [ %indvars.iv.next38, %._crit_edge10.us..lr.ph.us_crit_edge ]
  %54 = add nuw nsw i64 %indvars.iv39, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 0
  %55 = mul nuw nsw i64 %indvars.iv39, 1201
  %56 = add nuw nsw i64 %55, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %2, i64 0, i64 %56
  %57 = add nuw nsw i64 %indvars.iv39, 1
  %min.iters.check31 = icmp ult i64 %54, 4
  br i1 %min.iters.check31, label %.lr.ph.us.._crit_edge.preheader_crit_edge, label %min.iters.checked32

.lr.ph.us.._crit_edge.preheader_crit_edge:        ; preds = %.lr.ph.us
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %middle.block29.._crit_edge.preheader_crit_edge, %min.iters.checked32.._crit_edge.preheader_crit_edge, %.lr.ph.us.._crit_edge.preheader_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked32.._crit_edge.preheader_crit_edge ], [ 0, %.lr.ph.us.._crit_edge.preheader_crit_edge ], [ %n.vec34, %middle.block29.._crit_edge.preheader_crit_edge ]
  br label %._crit_edge

min.iters.checked32:                              ; preds = %.lr.ph.us
  %n.vec34 = and i64 %54, -4
  %cmp.zero35 = icmp eq i64 %n.vec34, 0
  br i1 %cmp.zero35, label %min.iters.checked32.._crit_edge.preheader_crit_edge, label %vector.ph36

min.iters.checked32.._crit_edge.preheader_crit_edge: ; preds = %min.iters.checked32
  br label %._crit_edge.preheader

vector.ph36:                                      ; preds = %min.iters.checked32
  br label %vector.body28

vector.body28:                                    ; preds = %vector.body28.vector.body28_crit_edge, %vector.ph36
  %index37 = phi i64 [ 0, %vector.ph36 ], [ %index.next38, %vector.body28.vector.body28_crit_edge ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %index37
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %59, align 8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %61, align 8
  %62 = fmul <2 x double> %wide.load45, %broadcast.splat48
  %63 = fmul <2 x double> %wide.load46, %broadcast.splat48
  %64 = bitcast double* %58 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8
  %65 = bitcast double* %60 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8
  %index.next38 = add i64 %index37, 4
  %66 = icmp eq i64 %index.next38, %n.vec34
  br i1 %66, label %middle.block29, label %vector.body28.vector.body28_crit_edge, !llvm.loop !19

vector.body28.vector.body28_crit_edge:            ; preds = %vector.body28
  br label %vector.body28

middle.block29:                                   ; preds = %vector.body28
  %cmp.n40 = icmp eq i64 %54, %n.vec34
  br i1 %cmp.n40, label %middle.block29..preheader.us16.preheader_crit_edge, label %middle.block29.._crit_edge.preheader_crit_edge

middle.block29.._crit_edge.preheader_crit_edge:   ; preds = %middle.block29
  br label %._crit_edge.preheader

middle.block29..preheader.us16.preheader_crit_edge: ; preds = %middle.block29
  br label %.preheader.us16.preheader

.preheader.us16.preheader.loopexit:               ; preds = %._crit_edge
  br label %.preheader.us16.preheader

.preheader.us16.preheader:                        ; preds = %middle.block29..preheader.us16.preheader_crit_edge, %.preheader.us16.preheader.loopexit
  %min.iters.check = icmp ult i64 %57, 2
  %n.vec = and i64 %57, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %57, %n.vec
  br label %.preheader.us16

._crit_edge.us19.loopexit:                        ; preds = %._crit_edge54
  br label %._crit_edge.us19

._crit_edge.us19:                                 ; preds = %middle.block.._crit_edge.us19_crit_edge, %._crit_edge.us19.loopexit
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 1000
  br i1 %exitcond35, label %._crit_edge10.us, label %._crit_edge.us19..preheader.us16_crit_edge

._crit_edge.us19..preheader.us16_crit_edge:       ; preds = %._crit_edge.us19
  br label %.preheader.us16

._crit_edge10.us:                                 ; preds = %._crit_edge.us19
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond42, label %._crit_edge14, label %._crit_edge10.us..lr.ph.us_crit_edge

._crit_edge10.us..lr.ph.us_crit_edge:             ; preds = %._crit_edge10.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  br label %.lr.ph.us

._crit_edge14:                                    ; preds = %._crit_edge10.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us..preheader.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.._crit_edge9_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge9_crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge9.._crit_edge_crit_edge

._crit_edge9.._crit_edge_crit_edge:               ; preds = %._crit_edge9
  br label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9.._crit_edge_crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond8, label %._crit_edge4, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
attributes #6 = { cold nounwind }

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
!19 = distinct !{!19, !3, !4}
