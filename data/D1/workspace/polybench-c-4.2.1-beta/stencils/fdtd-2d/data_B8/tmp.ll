; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
  %8 = alloca [1200 x double]*, align 8
  %9 = alloca [1200 x double]*, align 8
  store [1200 x double]* %4, [1200 x double]** %8, align 8
  store [1200 x double]* %5, [1200 x double]** %9, align 8
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph4.preheader, label %.preheader1

.lr.ph4.preheader:                                ; preds = %7
  %11 = add i32 %0, -1
  %xtraiter = and i32 %0, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph4.prol.loopexit, label %.lr.ph4.prol.preheader

.lr.ph4.prol.preheader:                           ; preds = %.lr.ph4.preheader
  br label %.lr.ph4.prol

.lr.ph4.prol:                                     ; preds = %.lr.ph4.prol.preheader, %.lr.ph4.prol
  %indvars.iv11.prol = phi i64 [ %indvars.iv.next12.prol, %.lr.ph4.prol ], [ 0, %.lr.ph4.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph4.prol ], [ %xtraiter, %.lr.ph4.prol.preheader ]
  %12 = trunc i64 %indvars.iv11.prol to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %6, i64 %indvars.iv11.prol
  store double %13, double* %14, align 8
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv11.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph4.prol.loopexit.loopexit, label %.lr.ph4.prol, !llvm.loop !1

.lr.ph4.prol.loopexit.loopexit:                   ; preds = %.lr.ph4.prol
  br label %.lr.ph4.prol.loopexit

.lr.ph4.prol.loopexit:                            ; preds = %.lr.ph4.prol.loopexit.loopexit, %.lr.ph4.preheader
  %indvars.iv11.unr = phi i64 [ 0, %.lr.ph4.preheader ], [ %indvars.iv.next12.prol, %.lr.ph4.prol.loopexit.loopexit ]
  %15 = icmp ult i32 %11, 7
  br i1 %15, label %.preheader1, label %.lr.ph4.preheader15

.lr.ph4.preheader15:                              ; preds = %.lr.ph4.prol.loopexit
  %wide.trip.count13.7 = zext i32 %0 to i64
  br label %.lr.ph4

.preheader1.loopexit:                             ; preds = %.lr.ph4
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit, %.lr.ph4.prol.loopexit, %7
  %16 = icmp sgt i32 %1, 0
  br i1 %16, label %.preheader.lr.ph, label %._crit_edge2

.preheader.lr.ph:                                 ; preds = %.preheader1
  %17 = icmp sgt i32 %2, 0
  %18 = sitofp i32 %1 to double
  %19 = sitofp i32 %2 to double
  %20 = load [1200 x double]*, [1200 x double]** %8, align 8
  %21 = load [1200 x double]*, [1200 x double]** %9, align 8
  br i1 %17, label %.preheader.us.preheader, label %._crit_edge2

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count8 = zext i32 %1 to i64
  %22 = insertelement <2 x double> undef, double %18, i32 0
  %23 = insertelement <2 x double> %22, double %19, i32 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %24 = trunc i64 %indvars.iv6 to i32
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  br label %28

; <label>:28:                                     ; preds = %28, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %28 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = trunc i64 %indvars.iv.next to i32
  %30 = sitofp i32 %29 to double
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv
  %32 = add nuw nsw i64 %indvars.iv, 2
  %33 = trunc i64 %32 to i32
  %34 = sitofp i32 %33 to double
  %35 = insertelement <2 x double> undef, double %30, i32 0
  %36 = insertelement <2 x double> %35, double %34, i32 1
  %37 = fmul <2 x double> %27, %36
  %38 = fdiv <2 x double> %37, %23
  %39 = extractelement <2 x double> %38, i32 0
  %40 = extractelement <2 x double> %38, i32 1
  store double %39, double* %31, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv6, i64 %indvars.iv
  store double %40, double* %41, align 8
  %42 = add nuw nsw i64 %indvars.iv, 3
  %43 = trunc i64 %42 to i32
  %44 = sitofp i32 %43 to double
  %45 = fmul double %25, %44
  %46 = fdiv double %45, %18
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv6, i64 %indvars.iv
  store double %46, double* %47, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %28

._crit_edge.us:                                   ; preds = %28
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge2.loopexit, label %.preheader.us

.lr.ph4:                                          ; preds = %.lr.ph4.preheader15, %.lr.ph4
  %indvars.iv11 = phi i64 [ %indvars.iv.next12.7, %.lr.ph4 ], [ %indvars.iv11.unr, %.lr.ph4.preheader15 ]
  %48 = trunc i64 %indvars.iv11 to i32
  %49 = sitofp i32 %48 to double
  %50 = getelementptr inbounds double, double* %6, i64 %indvars.iv11
  %51 = bitcast double* %50 to <2 x double>*
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %52 = trunc i64 %indvars.iv.next12 to i32
  %53 = sitofp i32 %52 to double
  %54 = insertelement <2 x double> undef, double %49, i32 0
  %55 = insertelement <2 x double> %54, double %53, i32 1
  store <2 x double> %55, <2 x double>* %51, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  %56 = trunc i64 %indvars.iv.next12.1 to i32
  %57 = sitofp i32 %56 to double
  %58 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.1
  %59 = bitcast double* %58 to <2 x double>*
  %indvars.iv.next12.2 = add nsw i64 %indvars.iv11, 3
  %60 = trunc i64 %indvars.iv.next12.2 to i32
  %61 = sitofp i32 %60 to double
  %62 = insertelement <2 x double> undef, double %57, i32 0
  %63 = insertelement <2 x double> %62, double %61, i32 1
  store <2 x double> %63, <2 x double>* %59, align 8
  %indvars.iv.next12.3 = add nsw i64 %indvars.iv11, 4
  %64 = trunc i64 %indvars.iv.next12.3 to i32
  %65 = sitofp i32 %64 to double
  %66 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.3
  %67 = bitcast double* %66 to <2 x double>*
  %indvars.iv.next12.4 = add nsw i64 %indvars.iv11, 5
  %68 = trunc i64 %indvars.iv.next12.4 to i32
  %69 = sitofp i32 %68 to double
  %70 = insertelement <2 x double> undef, double %65, i32 0
  %71 = insertelement <2 x double> %70, double %69, i32 1
  store <2 x double> %71, <2 x double>* %67, align 8
  %indvars.iv.next12.5 = add nsw i64 %indvars.iv11, 6
  %72 = trunc i64 %indvars.iv.next12.5 to i32
  %73 = sitofp i32 %72 to double
  %74 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.5
  %75 = bitcast double* %74 to <2 x double>*
  %indvars.iv.next12.6 = add nsw i64 %indvars.iv11, 7
  %76 = trunc i64 %indvars.iv.next12.6 to i32
  %77 = sitofp i32 %76 to double
  %78 = insertelement <2 x double> undef, double %73, i32 0
  %79 = insertelement <2 x double> %78, double %77, i32 1
  store <2 x double> %79, <2 x double>* %75, align 8
  %indvars.iv.next12.7 = add nsw i64 %indvars.iv11, 8
  %exitcond14.7 = icmp eq i64 %indvars.iv.next12.7, %wide.trip.count13.7
  br i1 %exitcond14.7, label %.preheader1.loopexit, label %.lr.ph4

._crit_edge2.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2.loopexit, %.preheader.lr.ph, %.preheader1
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
  %8 = alloca [1200 x double]*, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca double*, align 8
  store [1200 x double]* %3, [1200 x double]** %8, align 8
  store [1200 x double]* %4, [1200 x double]** %9, align 8
  store double* %6, double** %10, align 8
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader6.lr.ph, label %._crit_edge13

.preheader6.lr.ph:                                ; preds = %7
  %12 = icmp sgt i32 %2, 0
  %13 = load double*, double** %10, align 8
  %14 = load [1200 x double]*, [1200 x double]** %9, align 8
  %15 = load [1200 x double]*, [1200 x double]** %8, align 8
  %16 = add nsw i32 %1, -1
  %17 = add nsw i32 %2, -1
  %xtraiter = and i32 %2, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %18 = icmp ult i32 %17, 7
  %wide.trip.count.7 = zext i32 %2 to i64
  %xtraiter22 = and i32 %2, 1
  %lcmp.mod23 = icmp eq i32 %xtraiter22, 0
  %19 = icmp eq i32 %17, 0
  %wide.trip.count27 = zext i32 %1 to i64
  %wide.trip.count19.1 = zext i32 %2 to i64
  %xtraiter35 = and i32 %17, 1
  %lcmp.mod36 = icmp eq i32 %xtraiter35, 0
  %20 = icmp eq i32 %2, 2
  %wide.trip.count39 = zext i32 %1 to i64
  %wide.trip.count31.1 = zext i32 %2 to i64
  %wide.trip.count48 = zext i32 %16 to i64
  %wide.trip.count44 = zext i32 %17 to i64
  %wide.trip.count52 = zext i32 %0 to i64
  %21 = add nuw nsw i64 %wide.trip.count44, 1
  %22 = add nsw i64 %wide.trip.count31.1, -2
  %23 = add nsw i64 %wide.trip.count31.1, -2
  %24 = add nsw i64 %wide.trip.count31.1, -2
  %25 = add nsw i64 %wide.trip.count31.1, -2
  %.not = icmp slt i32 %1, 2
  %.not54 = icmp slt i32 %2, 1
  %brmerge = or i1 %.not, %.not54
  %.not55 = icmp slt i32 %1, 1
  %.not56 = icmp slt i32 %2, 2
  %brmerge57 = or i1 %.not55, %.not56
  %.not58 = icmp slt i32 %1, 2
  %.not59 = icmp slt i32 %2, 2
  %brmerge60 = or i1 %.not58, %.not59
  %min.iters.check = icmp ult i32 %17, 4
  %26 = and i32 %17, 3
  %n.mod.vf = zext i32 %26 to i64
  %n.vec = sub nsw i64 %wide.trip.count44, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %26, 0
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv50 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next51, %._crit_edge12 ]
  br i1 %12, label %.lr.ph, label %.preheader5

.lr.ph:                                           ; preds = %.preheader6
  %27 = getelementptr inbounds double, double* %13, i64 %indvars.iv50
  %28 = bitcast double* %27 to i64*
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv.prol
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %18, label %.preheader5, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.preheader5.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.prol.loopexit, %.preheader6
  br i1 %brmerge, label %.preheader4, label %.preheader2.us.preheader

.preheader2.us.preheader:                         ; preds = %.preheader5
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %32 = add i64 %indvar, 1
  %scevgep138 = getelementptr [1200 x double], [1200 x double]* %14, i64 %32, i64 2
  %scevgep144 = getelementptr [1200 x double], [1200 x double]* %5, i64 %32, i64 2
  %33 = add nsw i64 %indvars.iv25, -1
  br i1 %lcmp.mod23, label %.prol.loopexit21, label %.prol.preheader20

.prol.preheader20:                                ; preds = %.preheader2.us
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv25, i64 0
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 0
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %33, i64 0
  %39 = load double, double* %38, align 8
  %40 = fsub double %37, %39
  %41 = fmul double %40, 5.000000e-01
  %42 = fsub double %35, %41
  store double %42, double* %34, align 8
  br label %.prol.loopexit21

.prol.loopexit21:                                 ; preds = %.prol.preheader20, %.preheader2.us
  %indvars.iv17.unr.ph = phi i64 [ 1, %.prol.preheader20 ], [ 0, %.preheader2.us ]
  br i1 %19, label %._crit_edge.us, label %.preheader2.us.new.preheader

.preheader2.us.new.preheader:                     ; preds = %.prol.loopexit21
  %43 = sub nsw i64 %24, %indvars.iv17.unr.ph
  %44 = lshr i64 %43, 1
  %45 = add nuw i64 %44, 1
  %min.iters.check129 = icmp ult i64 %45, 2
  br i1 %min.iters.check129, label %.preheader2.us.new.preheader173, label %min.iters.checked130

min.iters.checked130:                             ; preds = %.preheader2.us.new.preheader
  %n.mod.vf131 = and i64 %45, 1
  %n.vec132 = sub i64 %45, %n.mod.vf131
  %cmp.zero133 = icmp eq i64 %n.vec132, 0
  br i1 %cmp.zero133, label %.preheader2.us.new.preheader173, label %vector.memcheck151

vector.memcheck151:                               ; preds = %min.iters.checked130
  %scevgep136 = getelementptr [1200 x double], [1200 x double]* %14, i64 %32, i64 %indvars.iv17.unr.ph
  %46 = sub nsw i64 %25, %indvars.iv17.unr.ph
  %47 = and i64 %46, -2
  %48 = or i64 %indvars.iv17.unr.ph, %47
  %scevgep139 = getelementptr double, double* %scevgep138, i64 %48
  %scevgep142 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 %indvars.iv17.unr.ph
  %scevgep145 = getelementptr double, double* %scevgep144, i64 %48
  %bound0147 = icmp ult double* %scevgep136, %scevgep145
  %bound1148 = icmp ult double* %scevgep142, %scevgep139
  %memcheck.conflict150 = and i1 %bound0147, %bound1148
  %49 = or i64 %indvars.iv17.unr.ph, 2
  %50 = shl nuw i64 %44, 1
  %51 = add i64 %49, %50
  %52 = shl nuw nsw i64 %n.mod.vf131, 1
  %ind.end156 = sub i64 %51, %52
  br i1 %memcheck.conflict150, label %.preheader2.us.new.preheader173, label %vector.body126.preheader

vector.body126.preheader:                         ; preds = %vector.memcheck151
  br label %vector.body126

vector.body126:                                   ; preds = %vector.body126.preheader, %vector.body126
  %index153 = phi i64 [ %index.next154, %vector.body126 ], [ 0, %vector.body126.preheader ]
  %53 = shl i64 %index153, 1
  %offset.idx158 = or i64 %indvars.iv17.unr.ph, %53
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv25, i64 %offset.idx158
  %55 = bitcast double* %54 to <4 x double>*
  %wide.vec162 = load <4 x double>, <4 x double>* %55, align 8, !alias.scope !4, !noalias !7
  %strided.vec163 = shufflevector <4 x double> %wide.vec162, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec164 = shufflevector <4 x double> %wide.vec162, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %offset.idx158
  %57 = bitcast double* %56 to <4 x double>*
  %wide.vec165 = load <4 x double>, <4 x double>* %57, align 8, !alias.scope !7
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %33, i64 %offset.idx158
  %59 = bitcast double* %58 to <4 x double>*
  %wide.vec168 = load <4 x double>, <4 x double>* %59, align 8, !alias.scope !7
  %60 = fsub <4 x double> %wide.vec165, %wide.vec168
  %61 = shufflevector <4 x double> %60, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %62 = fmul <2 x double> %61, <double 5.000000e-01, double 5.000000e-01>
  %63 = fsub <2 x double> %strided.vec163, %62
  %64 = add nuw nsw i64 %offset.idx158, 1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv25, i64 %64
  %66 = fsub <4 x double> %wide.vec165, %wide.vec168
  %67 = shufflevector <4 x double> %66, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %68 = fmul <2 x double> %67, <double 5.000000e-01, double 5.000000e-01>
  %69 = fsub <2 x double> %strided.vec164, %68
  %70 = getelementptr double, double* %65, i64 -1
  %71 = bitcast double* %70 to <4 x double>*
  %interleaved.vec171 = shufflevector <2 x double> %63, <2 x double> %69, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec171, <4 x double>* %71, align 8, !alias.scope !4, !noalias !7
  %index.next154 = add i64 %index153, 2
  %72 = icmp eq i64 %index.next154, %n.vec132
  br i1 %72, label %middle.block127, label %vector.body126, !llvm.loop !9

middle.block127:                                  ; preds = %vector.body126
  %cmp.n157 = icmp eq i64 %n.mod.vf131, 0
  br i1 %cmp.n157, label %._crit_edge.us, label %.preheader2.us.new.preheader173

.preheader2.us.new.preheader173:                  ; preds = %middle.block127, %vector.memcheck151, %min.iters.checked130, %.preheader2.us.new.preheader
  %indvars.iv17.ph = phi i64 [ %indvars.iv17.unr.ph, %vector.memcheck151 ], [ %indvars.iv17.unr.ph, %min.iters.checked130 ], [ %indvars.iv17.unr.ph, %.preheader2.us.new.preheader ], [ %ind.end156, %middle.block127 ]
  br label %.preheader2.us.new

.preheader2.us.new:                               ; preds = %.preheader2.us.new.preheader173, %.preheader2.us.new
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %.preheader2.us.new ], [ %indvars.iv17.ph, %.preheader2.us.new.preheader173 ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv25, i64 %indvars.iv17
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv17
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %33, i64 %indvars.iv17
  %78 = load double, double* %77, align 8
  %79 = fsub double %76, %78
  %80 = fmul double %79, 5.000000e-01
  %81 = fsub double %74, %80
  store double %81, double* %73, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv25, i64 %indvars.iv.next18
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv.next18
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %33, i64 %indvars.iv.next18
  %87 = load double, double* %86, align 8
  %88 = fsub double %85, %87
  %89 = fmul double %88, 5.000000e-01
  %90 = fsub double %83, %89
  store double %90, double* %82, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next18.1, %wide.trip.count19.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader2.us.new, !llvm.loop !12

._crit_edge.us.loopexit:                          ; preds = %.preheader2.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block127, %.prol.loopexit21
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.preheader4.loopexit, label %.preheader2.us

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %91 = load i64, i64* %28, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %94 = load i64, i64* %28, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv.next
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %97 = load i64, i64* %28, align 8
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv.next.1
  %99 = bitcast double* %98 to i64*
  store i64 %97, i64* %99, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %100 = load i64, i64* %28, align 8
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv.next.2
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %103 = load i64, i64* %28, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv.next.3
  %105 = bitcast double* %104 to i64*
  store i64 %103, i64* %105, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %106 = load i64, i64* %28, align 8
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv.next.4
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %109 = load i64, i64* %28, align 8
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv.next.5
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %112 = load i64, i64* %28, align 8
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv.next.6
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %.preheader5.loopexit, label %.lr.ph.new

.preheader4.loopexit:                             ; preds = %._crit_edge.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader5
  br i1 %brmerge57, label %.preheader3, label %.preheader1.us.preheader

.preheader1.us.preheader:                         ; preds = %.preheader4
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge9.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %15, i64 %indvars.iv37, i64 2
  %scevgep100 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 -1
  %scevgep103 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 2
  br i1 %lcmp.mod36, label %.prol.loopexit34, label %.prol.preheader33

.prol.preheader33:                                ; preds = %.preheader1.us
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv37, i64 1
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 1
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 0
  %120 = load double, double* %119, align 8
  %121 = fsub double %118, %120
  %122 = fmul double %121, 5.000000e-01
  %123 = fsub double %116, %122
  store double %123, double* %115, align 8
  br label %.prol.loopexit34

.prol.loopexit34:                                 ; preds = %.prol.preheader33, %.preheader1.us
  %indvars.iv29.unr.ph = phi i64 [ 2, %.prol.preheader33 ], [ 1, %.preheader1.us ]
  br i1 %20, label %._crit_edge9.us, label %.preheader1.us.new.preheader

.preheader1.us.new.preheader:                     ; preds = %.prol.loopexit34
  %124 = sub nsw i64 %22, %indvars.iv29.unr.ph
  %125 = lshr i64 %124, 1
  %126 = add nuw i64 %125, 1
  %min.iters.check88 = icmp ult i64 %126, 2
  br i1 %min.iters.check88, label %.preheader1.us.new.preheader172, label %min.iters.checked89

min.iters.checked89:                              ; preds = %.preheader1.us.new.preheader
  %n.mod.vf90 = and i64 %126, 1
  %n.vec91 = sub i64 %126, %n.mod.vf90
  %cmp.zero92 = icmp eq i64 %n.vec91, 0
  br i1 %cmp.zero92, label %.preheader1.us.new.preheader172, label %vector.memcheck110

vector.memcheck110:                               ; preds = %min.iters.checked89
  %scevgep95 = getelementptr [1200 x double], [1200 x double]* %15, i64 %indvars.iv37, i64 %indvars.iv29.unr.ph
  %127 = sub nsw i64 %23, %indvars.iv29.unr.ph
  %128 = and i64 %127, -2
  %129 = add nsw i64 %indvars.iv29.unr.ph, %128
  %scevgep98 = getelementptr double, double* %scevgep97, i64 %129
  %scevgep101 = getelementptr double, double* %scevgep100, i64 %indvars.iv29.unr.ph
  %scevgep104 = getelementptr double, double* %scevgep103, i64 %129
  %bound0106 = icmp ult double* %scevgep95, %scevgep104
  %bound1107 = icmp ult double* %scevgep101, %scevgep98
  %memcheck.conflict109 = and i1 %bound0106, %bound1107
  %130 = add nuw nsw i64 %indvars.iv29.unr.ph, 2
  %131 = shl nuw i64 %125, 1
  %132 = add i64 %130, %131
  %133 = shl nuw nsw i64 %n.mod.vf90, 1
  %ind.end = sub i64 %132, %133
  br i1 %memcheck.conflict109, label %.preheader1.us.new.preheader172, label %vector.body85.preheader

vector.body85.preheader:                          ; preds = %vector.memcheck110
  br label %vector.body85

vector.body85:                                    ; preds = %vector.body85.preheader, %vector.body85
  %index112 = phi i64 [ %index.next113, %vector.body85 ], [ 0, %vector.body85.preheader ]
  %134 = shl i64 %index112, 1
  %offset.idx = or i64 %indvars.iv29.unr.ph, %134
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv37, i64 %offset.idx
  %136 = bitcast double* %135 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %136, align 8, !alias.scope !13, !noalias !16
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec119 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %offset.idx
  %138 = getelementptr double, double* %137, i64 -1
  %139 = bitcast double* %138 to <4 x double>*
  %wide.vec120 = load <4 x double>, <4 x double>* %139, align 8, !alias.scope !16
  %strided.vec121 = shufflevector <4 x double> %wide.vec120, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec122 = shufflevector <4 x double> %wide.vec120, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %140 = fsub <2 x double> %strided.vec122, %strided.vec121
  %141 = fmul <2 x double> %140, <double 5.000000e-01, double 5.000000e-01>
  %142 = fsub <2 x double> %strided.vec, %141
  %143 = add nuw nsw i64 %offset.idx, 1
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv37, i64 %143
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %143
  %146 = getelementptr double, double* %145, i64 -1
  %147 = bitcast double* %146 to <4 x double>*
  %wide.vec123 = load <4 x double>, <4 x double>* %147, align 8, !alias.scope !16
  %strided.vec124 = shufflevector <4 x double> %wide.vec123, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec125 = shufflevector <4 x double> %wide.vec123, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %148 = fsub <2 x double> %strided.vec125, %strided.vec124
  %149 = fmul <2 x double> %148, <double 5.000000e-01, double 5.000000e-01>
  %150 = fsub <2 x double> %strided.vec119, %149
  %151 = getelementptr double, double* %144, i64 -1
  %152 = bitcast double* %151 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %142, <2 x double> %150, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %152, align 8, !alias.scope !13, !noalias !16
  %index.next113 = add i64 %index112, 2
  %153 = icmp eq i64 %index.next113, %n.vec91
  br i1 %153, label %middle.block86, label %vector.body85, !llvm.loop !18

middle.block86:                                   ; preds = %vector.body85
  %cmp.n115 = icmp eq i64 %n.mod.vf90, 0
  br i1 %cmp.n115, label %._crit_edge9.us, label %.preheader1.us.new.preheader172

.preheader1.us.new.preheader172:                  ; preds = %middle.block86, %vector.memcheck110, %min.iters.checked89, %.preheader1.us.new.preheader
  %indvars.iv29.ph = phi i64 [ %indvars.iv29.unr.ph, %vector.memcheck110 ], [ %indvars.iv29.unr.ph, %min.iters.checked89 ], [ %indvars.iv29.unr.ph, %.preheader1.us.new.preheader ], [ %ind.end, %middle.block86 ]
  br label %.preheader1.us.new

.preheader1.us.new:                               ; preds = %.preheader1.us.new.preheader172, %.preheader1.us.new
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.preheader1.us.new ], [ %indvars.iv29.ph, %.preheader1.us.new.preheader172 ]
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv37, i64 %indvars.iv29
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv29
  %157 = load double, double* %156, align 8
  %158 = add nsw i64 %indvars.iv29, -1
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %158
  %160 = load double, double* %159, align 8
  %161 = fsub double %157, %160
  %162 = fmul double %161, 5.000000e-01
  %163 = fsub double %155, %162
  store double %163, double* %154, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv37, i64 %indvars.iv.next30
  %165 = load double, double* %164, align 8
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next30
  %167 = load double, double* %166, align 8
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv29
  %169 = load double, double* %168, align 8
  %170 = fsub double %167, %169
  %171 = fmul double %170, 5.000000e-01
  %172 = fsub double %165, %171
  store double %172, double* %164, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30.1, %wide.trip.count31.1
  br i1 %exitcond32.1, label %._crit_edge9.us.loopexit, label %.preheader1.us.new, !llvm.loop !19

._crit_edge9.us.loopexit:                         ; preds = %.preheader1.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %middle.block86, %.prol.loopexit34
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond40, label %.preheader3.loopexit, label %.preheader1.us

.preheader3.loopexit:                             ; preds = %._crit_edge9.us
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %.preheader4
  br i1 %brmerge60, label %._crit_edge12, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader3
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 0
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %wide.trip.count44
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %15, i64 %indvars.iv46, i64 0
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %15, i64 %indvars.iv46, i64 %21
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %14, i64 %indvars.iv46, i64 0
  %173 = add i64 %indvars.iv46, 1
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %14, i64 %173, i64 %wide.trip.count44
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep66
  %bound1 = icmp ult double* %scevgep64, %scevgep62
  %found.conflict = and i1 %bound0, %bound1
  %bound072 = icmp ult double* %scevgep, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep62
  %found.conflict74 = and i1 %bound072, %bound173
  %conflict.rdx = or i1 %found.conflict, %found.conflict74
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %index
  %175 = bitcast double* %174 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %175, align 8, !alias.scope !20, !noalias !23
  %176 = getelementptr double, double* %174, i64 2
  %177 = bitcast double* %176 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %177, align 8, !alias.scope !20, !noalias !23
  %178 = or i64 %index, 1
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv46, i64 %178
  %180 = bitcast double* %179 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %180, align 8, !alias.scope !26
  %181 = getelementptr double, double* %179, i64 2
  %182 = bitcast double* %181 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %182, align 8, !alias.scope !26
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv46, i64 %index
  %184 = bitcast double* %183 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %184, align 8, !alias.scope !26
  %185 = getelementptr double, double* %183, i64 2
  %186 = bitcast double* %185 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %186, align 8, !alias.scope !26
  %187 = fsub <2 x double> %wide.load77, %wide.load79
  %188 = fsub <2 x double> %wide.load78, %wide.load80
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next47, i64 %index
  %190 = bitcast double* %189 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %190, align 8, !alias.scope !27
  %191 = getelementptr double, double* %189, i64 2
  %192 = bitcast double* %191 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %192, align 8, !alias.scope !27
  %193 = fadd <2 x double> %187, %wide.load81
  %194 = fadd <2 x double> %188, %wide.load82
  %195 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv46, i64 %index
  %196 = bitcast double* %195 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %196, align 8, !alias.scope !27
  %197 = getelementptr double, double* %195, i64 2
  %198 = bitcast double* %197 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %198, align 8, !alias.scope !27
  %199 = fsub <2 x double> %193, %wide.load83
  %200 = fsub <2 x double> %194, %wide.load84
  %201 = fmul <2 x double> %199, <double 7.000000e-01, double 7.000000e-01>
  %202 = fmul <2 x double> %200, <double 7.000000e-01, double 7.000000e-01>
  %203 = fsub <2 x double> %wide.load, %201
  %204 = fsub <2 x double> %wide.load76, %202
  %205 = bitcast double* %174 to <2 x double>*
  store <2 x double> %203, <2 x double>* %205, align 8, !alias.scope !20, !noalias !23
  %206 = bitcast double* %176 to <2 x double>*
  store <2 x double> %204, <2 x double>* %206, align 8, !alias.scope !20, !noalias !23
  %index.next = add i64 %index, 4
  %207 = icmp eq i64 %index.next, %n.vec
  br i1 %207, label %middle.block, label %vector.body, !llvm.loop !28

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge11.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv42.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %scalar.ph ], [ %indvars.iv42.ph, %scalar.ph.preheader ]
  %208 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %indvars.iv42
  %209 = load double, double* %208, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %210 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv46, i64 %indvars.iv.next43
  %211 = load double, double* %210, align 8
  %212 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv46, i64 %indvars.iv42
  %213 = load double, double* %212, align 8
  %214 = fsub double %211, %213
  %215 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next47, i64 %indvars.iv42
  %216 = load double, double* %215, align 8
  %217 = fadd double %214, %216
  %218 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv46, i64 %indvars.iv42
  %219 = load double, double* %218, align 8
  %220 = fsub double %217, %219
  %221 = fmul double %220, 7.000000e-01
  %222 = fsub double %209, %221
  store double %222, double* %208, align 8
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %._crit_edge11.us.loopexit, label %scalar.ph, !llvm.loop !29

._crit_edge11.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %middle.block
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge12.loopexit, label %.preheader.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.preheader3
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %._crit_edge13.loopexit, label %.preheader6

._crit_edge13.loopexit:                           ; preds = %._crit_edge12
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = icmp sgt i32 %0, 0
  %11 = icmp sgt i32 %1, 0
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.preheader8.us.preheader, label %._crit_edge15

.preheader8.us.preheader:                         ; preds = %5
  %12 = sext i32 %0 to i64
  %wide.trip.count35 = zext i32 %1 to i64
  %wide.trip.count39 = zext i32 %0 to i64
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge14.us, %.preheader8.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next38, %._crit_edge14.us ]
  %13 = mul nsw i64 %indvars.iv37, %12
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader8.us
  %indvars.iv33 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next34, %21 ]
  %15 = add nsw i64 %indvars.iv33, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #4
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv33
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #5
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %._crit_edge14.us, label %14

._crit_edge14.us:                                 ; preds = %21
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond40, label %._crit_edge15.loopexit, label %.preheader8.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #4
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %32 = icmp sgt i32 %0, 0
  %33 = icmp sgt i32 %1, 0
  %or.cond42 = and i1 %32, %33
  br i1 %or.cond42, label %.preheader7.us.preheader, label %._crit_edge12

.preheader7.us.preheader:                         ; preds = %._crit_edge15
  %34 = sext i32 %0 to i64
  %wide.trip.count26 = zext i32 %1 to i64
  %wide.trip.count30 = zext i32 %0 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us, %.preheader7.us.preheader
  %indvars.iv28 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next29, %._crit_edge11.us ]
  %35 = mul nsw i64 %indvars.iv28, %34
  br label %36

; <label>:36:                                     ; preds = %43, %.preheader7.us
  %indvars.iv24 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next25, %43 ]
  %37 = add nsw i64 %indvars.iv24, %35
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 20
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %36
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %42) #4
  br label %43

; <label>:43:                                     ; preds = %41, %36
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv24
  %46 = load double, double* %45, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %46) #5
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, %wide.trip.count26
  br i1 %exitcond27, label %._crit_edge11.us, label %36

._crit_edge11.us:                                 ; preds = %43
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond31, label %._crit_edge12.loopexit, label %.preheader7.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge15
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  %52 = icmp sgt i32 %0, 0
  %53 = icmp sgt i32 %1, 0
  %or.cond43 = and i1 %52, %53
  br i1 %or.cond43, label %.preheader.us.preheader, label %._crit_edge9

.preheader.us.preheader:                          ; preds = %._crit_edge12
  %54 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count21 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next20, %._crit_edge.us ]
  %55 = mul nsw i64 %indvars.iv19, %54
  br label %56

; <label>:56:                                     ; preds = %63, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %63 ]
  %57 = add nsw i64 %indvars.iv, %55
  %58 = trunc i64 %57 to i32
  %59 = srem i32 %58, 20
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %63

; <label>:61:                                     ; preds = %56
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %62) #4
  br label %63

; <label>:63:                                     ; preds = %61, %56
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv19, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %66) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %56

._crit_edge.us:                                   ; preds = %63
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge9.loopexit, label %.preheader.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge12
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %69 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24, !25}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !22}
!26 = !{!24}
!27 = !{!25}
!28 = distinct !{!28, !10, !11}
!29 = distinct !{!29, !10, !11}
