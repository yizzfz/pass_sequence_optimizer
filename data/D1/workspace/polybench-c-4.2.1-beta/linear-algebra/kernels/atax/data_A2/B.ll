; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  tail call void @init_array(i32 1900, i32 2100, [2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call void @print_array(i32 2100, double* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, [2100 x double]*, double*) #2 {
  %5 = sitofp i32 %1 to double
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.lr.ph24.preheader, label %.preheader17

.lr.ph24.preheader:                               ; preds = %4
  %xtraiter34 = and i32 %1, 1
  %lcmp.mod35 = icmp eq i32 %xtraiter34, 0
  br i1 %lcmp.mod35, label %.lr.ph24.prol.loopexit, label %.lr.ph24.prol

.lr.ph24.prol:                                    ; preds = %.lr.ph24.preheader
  %7 = fdiv double 0.000000e+00, %5
  %8 = fadd double %7, 1.000000e+00
  store double %8, double* %3, align 8
  br label %.lr.ph24.prol.loopexit

.lr.ph24.prol.loopexit:                           ; preds = %.lr.ph24.preheader, %.lr.ph24.prol
  %indvars.iv30.unr = phi i64 [ 0, %.lr.ph24.preheader ], [ 1, %.lr.ph24.prol ]
  %9 = icmp eq i32 %1, 1
  br i1 %9, label %.preheader17, label %.lr.ph24.preheader36

.lr.ph24.preheader36:                             ; preds = %.lr.ph24.prol.loopexit
  %wide.trip.count32.1 = zext i32 %1 to i64
  br label %.lr.ph24

.preheader17.loopexit:                            ; preds = %.lr.ph24
  br label %.preheader17

.preheader17:                                     ; preds = %.preheader17.loopexit, %.lr.ph24.prol.loopexit, %4
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader.lr.ph, label %._crit_edge21

.preheader.lr.ph:                                 ; preds = %.preheader17
  %11 = icmp sgt i32 %1, 0
  %12 = mul nsw i32 %0, 5
  %13 = sitofp i32 %12 to double
  br i1 %11, label %.preheader.us.preheader, label %._crit_edge21

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %14 = icmp eq i32 %1, 1
  %wide.trip.count28 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %15 = trunc i64 %indvars.iv26 to i32
  %16 = srem i32 %15, %1
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %13
  %19 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv26, i64 0
  store double %18, double* %19, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %14, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %20 = add nuw nsw i64 %indvars.iv, %indvars.iv26
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = add nuw nsw i64 %indvars.iv.next, %indvars.iv26
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, %1
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %13, i32 0
  %30 = insertelement <2 x double> %29, double %13, i32 1
  %31 = insertelement <2 x double> undef, double %23, i32 0
  %32 = insertelement <2 x double> %31, double %28, i32 1
  %33 = fdiv <2 x double> %32, %30
  %34 = bitcast double* %24 to <2 x double>*
  store <2 x double> %33, <2 x double>* %34, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %wide.trip.count28
  br i1 %exitcond, label %._crit_edge21.loopexit, label %.preheader.us

.lr.ph24:                                         ; preds = %.lr.ph24.preheader36, %.lr.ph24
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.1, %.lr.ph24 ], [ %indvars.iv30.unr, %.lr.ph24.preheader36 ]
  %35 = trunc i64 %indvars.iv30 to i32
  %36 = sitofp i32 %35 to double
  %37 = getelementptr inbounds double, double* %3, i64 %indvars.iv30
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %38 = trunc i64 %indvars.iv.next31 to i32
  %39 = sitofp i32 %38 to double
  %40 = insertelement <2 x double> undef, double %5, i32 0
  %41 = insertelement <2 x double> %40, double %5, i32 1
  %42 = insertelement <2 x double> undef, double %36, i32 0
  %43 = insertelement <2 x double> %42, double %39, i32 1
  %44 = fdiv <2 x double> %43, %41
  %45 = fadd <2 x double> %44, <double 1.000000e+00, double 1.000000e+00>
  %46 = bitcast double* %37 to <2 x double>*
  store <2 x double> %45, <2 x double>* %46, align 8
  %indvars.iv.next31.1 = add nuw nsw i64 %indvars.iv30, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next31.1, %wide.trip.count32.1
  br i1 %exitcond33.1, label %.preheader17.loopexit, label %.lr.ph24

._crit_edge21.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.preheader.lr.ph, %.preheader17
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_atax(i32, i32, [2100 x double]*, double*, double*, double*) #2 {
  %7 = bitcast double* %5 to i8*
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.preheader30.loopexit, label %.preheader30

.preheader30.loopexit:                            ; preds = %6
  %9 = bitcast double* %4 to i8*
  %10 = add i32 %1, -1
  %11 = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %11, 3
  %13 = add nuw nsw i64 %12, 8
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %13, i32 8, i1 false)
  br label %.preheader30

.preheader30:                                     ; preds = %.preheader30.loopexit, %6
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.lr.ph35, label %._crit_edge36

.lr.ph35:                                         ; preds = %.preheader30
  %15 = icmp sgt i32 %1, 0
  %16 = icmp sgt i32 %1, 0
  br i1 %15, label %.lr.ph35.split.us.preheader, label %._crit_edge36.loopexit48

.lr.ph35.split.us.preheader:                      ; preds = %.lr.ph35
  %17 = add i32 %1, -1
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %18 = icmp eq i32 %17, 0
  %xtraiter52 = and i32 %1, 1
  %lcmp.mod53 = icmp eq i32 %xtraiter52, 0
  %19 = icmp eq i32 %17, 0
  %wide.trip.count51.1 = zext i32 %1 to i64
  %wide.trip.count58 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %20 = add nsw i64 %wide.trip.count51.1, -2
  %scevgep70 = getelementptr double, double* %4, i64 2
  %21 = add nsw i64 %wide.trip.count51.1, -2
  br label %.lr.ph35.split.us

.lr.ph35.split.us:                                ; preds = %._crit_edge.us, %.lr.ph35.split.us.preheader
  %indvars.iv56 = phi i64 [ 0, %.lr.ph35.split.us.preheader ], [ %indvars.iv.next57, %._crit_edge.us ]
  %scevgep76 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv56, i64 2
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv56
  store double 0.000000e+00, double* %22, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph35.split.us
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv56, i64 0
  %25 = load double, double* %24, align 8
  %26 = load double, double* %3, align 8
  %27 = fmul double %25, %26
  %28 = fadd double %23, %27
  store double %28, double* %22, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph35.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph35.split.us ]
  br i1 %18, label %..preheader_crit_edge.us, label %.lr.ph35.split.us.new.preheader

.lr.ph35.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph35.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph33.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block, %.lr.ph33.us.prol.loopexit, %..preheader_crit_edge.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %wide.trip.count58
  br i1 %exitcond, label %._crit_edge36.loopexit, label %.lr.ph35.split.us

.lr.ph33.us:                                      ; preds = %.lr.ph33.us.preheader87, %.lr.ph33.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %.lr.ph33.us ], [ %indvars.iv49.ph, %.lr.ph33.us.preheader87 ]
  %29 = getelementptr inbounds double, double* %4, i64 %indvars.iv49
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv56, i64 %indvars.iv49
  %32 = load double, double* %31, align 8
  %33 = load double, double* %22, align 8
  %34 = fmul double %32, %33
  %35 = fadd double %30, %34
  store double %35, double* %29, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %36 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next50
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv56, i64 %indvars.iv.next50
  %39 = load double, double* %38, align 8
  %40 = load double, double* %22, align 8
  %41 = fmul double %39, %40
  %42 = fadd double %37, %41
  store double %42, double* %36, align 8
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond.155 = icmp eq i64 %indvars.iv.next50.1, %wide.trip.count51.1
  br i1 %exitcond.155, label %._crit_edge.us.loopexit, label %.lr.ph33.us, !llvm.loop !1

.lr.ph35.split.us.new:                            ; preds = %.lr.ph35.split.us.new.preheader, %.lr.ph35.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph35.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph35.split.us.new.preheader ]
  %43 = load double, double* %22, align 8
  %44 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv56, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %43, %48
  store double %49, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv56, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %49, %54
  store double %55, double* %22, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %..preheader_crit_edge.us.loopexit, label %.lr.ph35.split.us.new

..preheader_crit_edge.us.loopexit:                ; preds = %.lr.ph35.split.us.new
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %.prol.loopexit
  br i1 %16, label %.lr.ph33.us.preheader, label %._crit_edge.us

.lr.ph33.us.preheader:                            ; preds = %..preheader_crit_edge.us
  br i1 %lcmp.mod53, label %.lr.ph33.us.prol.loopexit, label %.lr.ph33.us.prol

.lr.ph33.us.prol:                                 ; preds = %.lr.ph33.us.preheader
  %56 = load double, double* %4, align 8
  %57 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv56, i64 0
  %58 = load double, double* %57, align 8
  %59 = load double, double* %22, align 8
  %60 = fmul double %58, %59
  %61 = fadd double %56, %60
  store double %61, double* %4, align 8
  br label %.lr.ph33.us.prol.loopexit

.lr.ph33.us.prol.loopexit:                        ; preds = %.lr.ph33.us.prol, %.lr.ph33.us.preheader
  %indvars.iv49.unr.ph = phi i64 [ 1, %.lr.ph33.us.prol ], [ 0, %.lr.ph33.us.preheader ]
  br i1 %19, label %._crit_edge.us, label %.lr.ph33.us.preheader68

.lr.ph33.us.preheader68:                          ; preds = %.lr.ph33.us.prol.loopexit
  %62 = sub nsw i64 %20, %indvars.iv49.unr.ph
  %63 = lshr i64 %62, 1
  %64 = add nuw i64 %63, 1
  %min.iters.check = icmp ult i64 %64, 2
  br i1 %min.iters.check, label %.lr.ph33.us.preheader87, label %min.iters.checked

.lr.ph33.us.preheader87:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph33.us.preheader68
  %indvars.iv49.ph = phi i64 [ %indvars.iv49.unr.ph, %vector.memcheck ], [ %indvars.iv49.unr.ph, %min.iters.checked ], [ %indvars.iv49.unr.ph, %.lr.ph33.us.preheader68 ], [ %ind.end, %middle.block ]
  br label %.lr.ph33.us

min.iters.checked:                                ; preds = %.lr.ph33.us.preheader68
  %n.mod.vf = and i64 %64, 1
  %n.vec = sub i64 %64, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph33.us.preheader87, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %4, i64 %indvars.iv49.unr.ph
  %65 = sub nsw i64 %21, %indvars.iv49.unr.ph
  %66 = and i64 %65, -2
  %67 = or i64 %indvars.iv49.unr.ph, %66
  %scevgep71 = getelementptr double, double* %scevgep70, i64 %67
  %scevgep74 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv56, i64 %indvars.iv49.unr.ph
  %scevgep77 = getelementptr double, double* %scevgep76, i64 %67
  %bound0 = icmp ult double* %scevgep, %scevgep77
  %bound1 = icmp ult double* %scevgep74, %scevgep71
  %found.conflict = and i1 %bound0, %bound1
  %bound080 = icmp ult double* %scevgep, %22
  %bound181 = icmp ult double* %22, %scevgep71
  %found.conflict82 = and i1 %bound080, %bound181
  %conflict.rdx = or i1 %found.conflict, %found.conflict82
  %68 = or i64 %indvars.iv49.unr.ph, 2
  %69 = shl nuw i64 %63, 1
  %70 = add i64 %68, %69
  %71 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %70, %71
  br i1 %conflict.rdx, label %.lr.ph33.us.preheader87, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %72 = load double, double* %22, align 8, !alias.scope !4
  %73 = insertelement <2 x double> undef, double %72, i32 0
  %74 = shufflevector <2 x double> %73, <2 x double> undef, <2 x i32> zeroinitializer
  %75 = load double, double* %22, align 8, !alias.scope !4
  %76 = insertelement <2 x double> undef, double %75, i32 0
  %77 = shufflevector <2 x double> %76, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %78 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv49.unr.ph, %78
  %79 = getelementptr inbounds double, double* %4, i64 %offset.idx
  %80 = bitcast double* %79 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %80, align 8, !alias.scope !7, !noalias !9
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec83 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %81 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv56, i64 %offset.idx
  %82 = bitcast double* %81 to <4 x double>*
  %wide.vec84 = load <4 x double>, <4 x double>* %82, align 8, !alias.scope !11
  %strided.vec85 = shufflevector <4 x double> %wide.vec84, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec86 = shufflevector <4 x double> %wide.vec84, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %83 = fmul <2 x double> %strided.vec85, %74
  %84 = fadd <2 x double> %strided.vec, %83
  %85 = add nuw nsw i64 %offset.idx, 1
  %86 = getelementptr inbounds double, double* %4, i64 %85
  %87 = fmul <2 x double> %strided.vec86, %77
  %88 = fadd <2 x double> %strided.vec83, %87
  %89 = getelementptr double, double* %86, i64 -1
  %90 = bitcast double* %89 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %84, <2 x double> %88, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %90, align 8, !alias.scope !7, !noalias !9
  %index.next = add i64 %index, 2
  %91 = icmp eq i64 %index.next, %n.vec
  br i1 %91, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.us, label %.lr.ph33.us.preheader87

._crit_edge36.loopexit48:                         ; preds = %.lr.ph35
  %92 = add i32 %0, -1
  %93 = zext i32 %92 to i64
  %94 = shl nuw nsw i64 %93, 3
  %95 = add nuw nsw i64 %94, 8
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %95, i32 8, i1 false)
  br label %._crit_edge36

._crit_edge36.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36.loopexit, %._crit_edge36.loopexit48, %.preheader30
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %13
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %.lr.ph, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10, !5}
!10 = distinct !{!10, !6}
!11 = !{!10}
!12 = distinct !{!12, !2, !3}
