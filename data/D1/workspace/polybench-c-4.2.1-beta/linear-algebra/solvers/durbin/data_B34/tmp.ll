; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = bitcast i8* %3 to double*
  tail call fastcc void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #3
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %12

; <label>:12:                                     ; preds = %8, %2, %11
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, double*) unnamed_addr #0 {
.lr.ph:
  br label %2

; <label>:2:                                      ; preds = %2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.4, %2 ]
  %3 = trunc i64 %indvars.iv to i32
  %4 = sub nuw nsw i32 2001, %3
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %5, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = trunc i64 %indvars.iv.next to i32
  %8 = sub nuw nsw i32 2001, %7
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %9, double* %10, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %11 = trunc i64 %indvars.iv.next.1 to i32
  %12 = sub nuw nsw i32 2001, %11
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %13, double* %14, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %15 = trunc i64 %indvars.iv.next.2 to i32
  %16 = sub nuw nsw i32 2001, %15
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %17, double* %18, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %19 = trunc i64 %indvars.iv.next.3 to i32
  %20 = sub nuw nsw i32 2001, %19
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.3
  store double %21, double* %22, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge, label %2

._crit_edge:                                      ; preds = %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double*, double*) unnamed_addr #0 {
.lr.ph17.preheader:
  %3 = alloca [2000 x double], align 16
  %4 = load double, double* %1, align 8
  %5 = fsub double -0.000000e+00, %4
  store double %5, double* %2, align 8
  %6 = load double, double* %1, align 8
  %7 = fsub double -0.000000e+00, %6
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 0
  %sunkaddr = ptrtoint double* %2 to i64
  %9 = bitcast double* %2 to i8*
  %10 = bitcast [2000 x double]* %3 to i8*
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge12, %.lr.ph17.preheader
  %indvars.iv62 = phi i2 [ %indvars.iv.next63, %._crit_edge12 ], [ 1, %.lr.ph17.preheader ]
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge12 ], [ 1, %.lr.ph17.preheader ]
  %indvar = phi i64 [ %13, %._crit_edge12 ], [ 0, %.lr.ph17.preheader ]
  %.0314 = phi double [ %60, %._crit_edge12 ], [ %7, %.lr.ph17.preheader ]
  %.0413 = phi double [ %18, %._crit_edge12 ], [ 1.000000e+00, %.lr.ph17.preheader ]
  %11 = zext i2 %indvars.iv62 to i64
  %12 = add nsw i64 %indvar, -1
  %13 = add nuw nsw i64 %indvar, 1
  %14 = shl i64 %indvar, 3
  %15 = add nuw nsw i64 %14, 8
  %16 = fmul double %.0314, %.0314
  %17 = fsub double 1.000000e+00, %16
  %18 = fmul double %.0413, %17
  %19 = add nsw i64 %indvars.iv33, -1
  %xtraiter = and i64 %13, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.025.prol = phi double [ %26, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %20 = sub nsw i64 %19, %indvars.iv.prol
  %21 = getelementptr inbounds double, double* %1, i64 %20
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %.025.prol, %25
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %11, %.prol.loopexit.loopexit ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %26, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %26, %.prol.loopexit.loopexit ]
  %27 = icmp ult i64 %indvar, 3
  br i1 %27, label %.lr.ph9, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.025 = phi double [ %55, %.lr.ph.new ], [ %.025.unr, %.lr.ph.new.preheader ]
  %28 = sub nsw i64 %19, %indvars.iv
  %29 = getelementptr inbounds double, double* %1, i64 %28
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %.025, %33
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %35 = sub nsw i64 %19, %indvars.iv.next
  %36 = getelementptr inbounds double, double* %1, i64 %35
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %34, %40
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %42 = sub nsw i64 %19, %indvars.iv.next.1
  %43 = getelementptr inbounds double, double* %1, i64 %42
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %41, %47
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %49 = sub nsw i64 %19, %indvars.iv.next.2
  %50 = getelementptr inbounds double, double* %1, i64 %49
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %48, %54
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv33
  br i1 %exitcond.3, label %.lr.ph9.loopexit, label %.lr.ph.new

.lr.ph9.loopexit:                                 ; preds = %.lr.ph.new
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %55, %.lr.ph9.loopexit ]
  %56 = getelementptr inbounds double, double* %1, i64 %indvars.iv33
  %57 = load double, double* %56, align 8
  %58 = fadd double %.lcssa, %57
  %59 = fsub double -0.000000e+00, %58
  %60 = fdiv double %59, %18
  %61 = and i64 %indvar, 1
  %lcmp.mod42 = icmp eq i64 %61, 0
  br i1 %lcmp.mod42, label %.prol.preheader39, label %.prol.loopexit40

.prol.preheader39:                                ; preds = %.lr.ph9
  %62 = load double, double* %2, align 8
  %sunkaddr47 = shl nuw nsw i64 %indvars.iv33, 3
  %sunkaddr48 = add i64 %sunkaddr, %sunkaddr47
  %sunkaddr49 = add i64 %sunkaddr48, -8
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to double*
  %63 = load double, double* %sunkaddr50, align 8
  %64 = fmul double %60, %63
  %65 = fadd double %62, %64
  store double %65, double* %8, align 16
  br label %.prol.loopexit40

.prol.loopexit40:                                 ; preds = %.prol.preheader39, %.lr.ph9
  %indvars.iv21.unr.ph = phi i64 [ 1, %.prol.preheader39 ], [ 0, %.lr.ph9 ]
  %66 = icmp eq i64 %indvar, 0
  br i1 %66, label %._crit_edge12, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit40
  %67 = sub i64 %12, %indvars.iv21.unr.ph
  %68 = lshr i64 %67, 1
  %69 = add nuw i64 %68, 1
  %min.iters.check = icmp ult i64 %69, 2
  br i1 %min.iters.check, label %.lr.ph9.new.preheader64, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9.new.preheader
  %n.mod.vf = and i64 %69, 1
  %n.vec = sub i64 %69, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %70 = or i64 %indvars.iv21.unr.ph, 2
  %71 = shl nuw i64 %68, 1
  %72 = add i64 %70, %71
  %73 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %72, %73
  br i1 %cmp.zero, label %.lr.ph9.new.preheader64, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert58 = insertelement <2 x double> undef, double %60, i32 0
  %broadcast.splat59 = shufflevector <2 x double> %broadcast.splatinsert58, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %74 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv21.unr.ph, %74
  %75 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %76 = bitcast double* %75 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %76, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec53 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %77 = sub nsw i64 %19, %offset.idx
  %78 = getelementptr inbounds double, double* %2, i64 %77
  %79 = getelementptr double, double* %78, i64 -3
  %80 = bitcast double* %79 to <4 x double>*
  %wide.vec54 = load <4 x double>, <4 x double>* %80, align 8
  %strided.vec55 = shufflevector <4 x double> %wide.vec54, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec55, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec56 = shufflevector <4 x double> %wide.vec54, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse57 = shufflevector <2 x double> %strided.vec56, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %81 = fmul <2 x double> %broadcast.splat59, %reverse57
  %82 = fadd <2 x double> %strided.vec, %81
  %83 = add nuw nsw i64 %offset.idx, 1
  %84 = fmul <2 x double> %broadcast.splat59, %reverse
  %85 = fadd <2 x double> %strided.vec53, %84
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %83
  %87 = getelementptr double, double* %86, i64 -1
  %88 = bitcast double* %87 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %82, <2 x double> %85, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %88, align 8
  %index.next = add i64 %index, 2
  %89 = icmp eq i64 %index.next, %n.vec
  br i1 %89, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge12, label %.lr.ph9.new.preheader64

.lr.ph9.new.preheader64:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph9.new.preheader
  %indvars.iv21.ph = phi i64 [ %indvars.iv21.unr.ph, %min.iters.checked ], [ %indvars.iv21.unr.ph, %.lr.ph9.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new.preheader64, %.lr.ph9.new
  %indvars.iv21 = phi i64 [ %indvars.iv.next22.1, %.lr.ph9.new ], [ %indvars.iv21.ph, %.lr.ph9.new.preheader64 ]
  %90 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %91 = load double, double* %90, align 8
  %92 = sub nsw i64 %19, %indvars.iv21
  %93 = getelementptr inbounds double, double* %2, i64 %92
  %94 = load double, double* %93, align 8
  %95 = fmul double %60, %94
  %96 = fadd double %91, %95
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv21
  store double %96, double* %97, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %98 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next22
  %99 = load double, double* %98, align 8
  %100 = sub nsw i64 %19, %indvars.iv.next22
  %101 = getelementptr inbounds double, double* %2, i64 %100
  %102 = load double, double* %101, align 8
  %103 = fmul double %60, %102
  %104 = fadd double %99, %103
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv.next22
  store double %104, double* %105, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %exitcond26.1 = icmp eq i64 %indvars.iv.next22.1, %indvars.iv33
  br i1 %exitcond26.1, label %._crit_edge12.loopexit, label %.lr.ph9.new, !llvm.loop !6

._crit_edge12.loopexit:                           ; preds = %.lr.ph9.new
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %middle.block, %.prol.loopexit40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* nonnull %10, i64 %15, i32 8, i1 false)
  %106 = getelementptr inbounds double, double* %2, i64 %indvars.iv33
  store double %60, double* %106, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %13, 1999
  %indvars.iv.next63 = add i2 %indvars.iv62, 1
  br i1 %exitcond36, label %._crit_edge18, label %.lr.ph

._crit_edge18:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %11, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %11 ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %11

; <label>:11:                                     ; preds = %.lr.ph, %9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %11
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
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
