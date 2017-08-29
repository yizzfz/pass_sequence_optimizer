; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast i8* %5 to [2000 x double]*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  %21 = bitcast i8* %12 to double*
  %22 = bitcast i8* %13 to double*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  call fastcc void @kernel_gemver(double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %._crit_edge

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  call fastcc void @print_array(double* %30)
  br label %._crit_edge

._crit_edge:                                      ; preds = %26, %2, %29
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  call void @free(i8* %10) #4
  call void @free(i8* %11) #4
  call void @free(i8* %12) #4
  call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph4.split.us.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.lr.ph4.split.us.new.preheader

.lr.ph4.split.us.new.preheader:                   ; preds = %._crit_edge.us, %.lr.ph4.split.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %11 = trunc i64 %indvars.iv11 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv11
  store double %12, double* %13, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %14 = trunc i64 %indvars.iv.next12 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %5, i64 %indvars.iv11
  %17 = insertelement <2 x double> undef, double %15, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = fdiv <2 x double> %18, <double 2.000000e+03, double 2.000000e+03>
  %20 = fmul <2 x double> %19, <double 5.000000e-01, double 2.500000e-01>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %16, align 8
  %23 = getelementptr inbounds double, double* %4, i64 %indvars.iv11
  store double %22, double* %23, align 8
  %24 = getelementptr inbounds double, double* %6, i64 %indvars.iv11
  %25 = fdiv double %15, 2.000000e+03
  %26 = fmul double %25, 1.250000e-01
  %27 = getelementptr inbounds double, double* %9, i64 %indvars.iv11
  store double %26, double* %27, align 8
  %28 = fdiv <2 x double> %19, <double 6.000000e+00, double 9.000000e+00>
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  store double %29, double* %24, align 8
  %31 = getelementptr inbounds double, double* %10, i64 %indvars.iv11
  store double %30, double* %31, align 8
  %32 = getelementptr inbounds double, double* %8, i64 %indvars.iv11
  store double 0.000000e+00, double* %32, align 8
  %33 = getelementptr inbounds double, double* %7, i64 %indvars.iv11
  store double 0.000000e+00, double* %33, align 8
  br label %.lr.ph4.split.us.new

.lr.ph4.split.us.new:                             ; preds = %.lr.ph4.split.us.new, %.lr.ph4.split.us.new.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph4.split.us.new ]
  %34 = mul nuw nsw i64 %indvars.iv, %indvars.iv11
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 2000
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %39 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv11
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 2000
  %42 = sitofp i32 %41 to double
  %43 = insertelement <2 x double> undef, double %37, i32 0
  %44 = insertelement <2 x double> %43, double %42, i32 1
  %45 = fdiv <2 x double> %44, <double 2.000000e+03, double 2.000000e+03>
  %46 = bitcast double* %38 to <2 x double>*
  store <2 x double> %45, <2 x double>* %46, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph4.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph4.split.us.new
  %exitcond = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph4.split.us.new.preheader

._crit_edge:                                      ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]*, double* readonly, double* readonly, double* readonly, double* readonly, double*, double*, double* nocapture readonly, double* readonly) unnamed_addr #2 {
.preheader11.us.preheader:
  %scevgep8 = getelementptr double, double* %4, i64 2000
  %scevgep10 = getelementptr double, double* %6, i64 2000
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %._crit_edge28.us, %.preheader11.us.preheader
  %indvars.iv59 = phi i64 [ 0, %.preheader11.us.preheader ], [ %indvars.iv.next60, %._crit_edge28.us ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %indvars.iv59, i64 0
  %11 = add i64 %indvars.iv59, 1
  %scevgep6 = getelementptr [2000 x double], [2000 x double]* %2, i64 %11, i64 0
  %12 = getelementptr inbounds double, double* %3, i64 %indvars.iv59
  %13 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  %bound0 = icmp ult double* %scevgep, %12
  %bound1 = icmp ult double* %12, %scevgep6
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep, %scevgep8
  %bound114 = icmp ugt double* %scevgep6, %4
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %bound018 = icmp ult double* %scevgep, %13
  %bound119 = icmp ult double* %13, %scevgep6
  %found.conflict20 = and i1 %bound018, %bound119
  %conflict.rdx21 = or i1 %conflict.rdx, %found.conflict20
  %bound022 = icmp ult double* %scevgep, %scevgep10
  %bound123 = icmp ugt double* %scevgep6, %6
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx25 = or i1 %conflict.rdx21, %found.conflict24
  br i1 %conflict.rdx25, label %._crit_edge.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

._crit_edge.preheader:                            ; preds = %vector.memcheck
  br label %._crit_edge

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv59, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1, !noalias !4
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1, !noalias !4
  %18 = load double, double* %12, align 8, !alias.scope !9
  %19 = insertelement <2 x double> undef, double %18, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x double> undef, double %18, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  %23 = getelementptr inbounds double, double* %4, i64 %index
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load28 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !10
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !10
  %27 = fmul <2 x double> %20, %wide.load28
  %28 = fmul <2 x double> %22, %wide.load29
  %29 = fadd <2 x double> %wide.load, %27
  %30 = fadd <2 x double> %wide.load27, %28
  %31 = load double, double* %13, align 8, !alias.scope !11
  %32 = insertelement <2 x double> undef, double %31, i32 0
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  %34 = insertelement <2 x double> undef, double %31, i32 0
  %35 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> zeroinitializer
  %36 = getelementptr inbounds double, double* %6, i64 %index
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load30 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !12
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load31 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !12
  %40 = fmul <2 x double> %33, %wide.load30
  %41 = fmul <2 x double> %35, %wide.load31
  %42 = fadd <2 x double> %29, %40
  %43 = fadd <2 x double> %30, %41
  %44 = bitcast double* %14 to <2 x double>*
  store <2 x double> %42, <2 x double>* %44, align 8, !alias.scope !1, !noalias !4
  %45 = bitcast double* %16 to <2 x double>*
  store <2 x double> %43, <2 x double>* %45, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 4
  %46 = icmp eq i64 %index.next, 2000
  br i1 %46, label %._crit_edge28.us.loopexit84, label %vector.body, !llvm.loop !13

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv57 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next58.1, %._crit_edge ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv59, i64 %indvars.iv57
  %48 = load double, double* %47, align 8
  %49 = load double, double* %12, align 8
  %50 = getelementptr inbounds double, double* %4, i64 %indvars.iv57
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %48, %52
  %54 = load double, double* %13, align 8
  %55 = getelementptr inbounds double, double* %6, i64 %indvars.iv57
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %53, %57
  store double %58, double* %47, align 8
  %indvars.iv.next58 = or i64 %indvars.iv57, 1
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv59, i64 %indvars.iv.next58
  %60 = load double, double* %59, align 8
  %61 = load double, double* %12, align 8
  %62 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next58
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %60, %64
  %66 = load double, double* %13, align 8
  %67 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next58
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fadd double %65, %69
  store double %70, double* %59, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %exitcond3.1 = icmp eq i64 %indvars.iv.next58.1, 2000
  br i1 %exitcond3.1, label %._crit_edge28.us.loopexit, label %._crit_edge, !llvm.loop !16

._crit_edge28.us.loopexit:                        ; preds = %._crit_edge
  br label %._crit_edge28.us

._crit_edge28.us.loopexit84:                      ; preds = %vector.body
  br label %._crit_edge28.us

._crit_edge28.us:                                 ; preds = %._crit_edge28.us.loopexit84, %._crit_edge28.us.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next60, 2000
  br i1 %exitcond4, label %.prol.loopexit64..preheader9.us.new_crit_edge.preheader, label %vector.memcheck

.prol.loopexit64..preheader9.us.new_crit_edge.preheader: ; preds = %._crit_edge28.us
  br label %.prol.loopexit64..preheader9.us.new_crit_edge

.prol.loopexit64..preheader9.us.new_crit_edge:    ; preds = %._crit_edge20.us, %.prol.loopexit64..preheader9.us.new_crit_edge.preheader
  %indvars.iv53 = phi i64 [ 0, %.prol.loopexit64..preheader9.us.new_crit_edge.preheader ], [ %indvars.iv.next54, %._crit_edge20.us ]
  %71 = ptrtoint double* %8 to i64
  %sunkaddr59 = shl i64 %indvars.iv53, 3
  %sunkaddr60 = add i64 %71, %sunkaddr59
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to double*
  %.pre = load double, double* %sunkaddr61, align 8
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new, %.prol.loopexit64..preheader9.us.new_crit_edge
  %72 = phi double [ %.pre, %.prol.loopexit64..preheader9.us.new_crit_edge ], [ %86, %.preheader9.us.new ]
  %indvars.iv49 = phi i64 [ 0, %.prol.loopexit64..preheader9.us.new_crit_edge ], [ %indvars.iv.next50.1, %.preheader9.us.new ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv49, i64 %indvars.iv53
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %1
  %76 = getelementptr inbounds double, double* %9, i64 %indvars.iv49
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fadd double %72, %78
  %sunkaddr = ptrtoint double* %8 to i64
  %sunkaddr76 = mul i64 %indvars.iv53, 8
  %sunkaddr77 = add i64 %sunkaddr, %sunkaddr76
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to double*
  store double %79, double* %sunkaddr78, align 8
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next50, i64 %indvars.iv53
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %1
  %83 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next50
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fadd double %79, %85
  store double %86, double* %sunkaddr78, align 8
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, 2000
  br i1 %exitcond52.1, label %._crit_edge20.us, label %.preheader9.us.new

._crit_edge20.us:                                 ; preds = %.preheader9.us.new
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next54, 2000
  br i1 %exitcond2, label %vector.memcheck45, label %.prol.loopexit64..preheader9.us.new_crit_edge

vector.memcheck45:                                ; preds = %._crit_edge20.us
  %scevgep37 = getelementptr double, double* %8, i64 2000
  %scevgep39 = getelementptr double, double* %10, i64 2000
  %bound041 = icmp ugt double* %scevgep39, %8
  %bound142 = icmp ugt double* %scevgep37, %10
  %memcheck.conflict44 = and i1 %bound041, %bound142
  br i1 %memcheck.conflict44, label %._crit_edge69.preheader, label %vector.body32.preheader

vector.body32.preheader:                          ; preds = %vector.memcheck45
  br label %vector.body32

._crit_edge69.preheader:                          ; preds = %vector.memcheck45
  br label %._crit_edge69

vector.body32:                                    ; preds = %vector.body32, %vector.body32.preheader
  %index47 = phi i64 [ 0, %vector.body32.preheader ], [ %index.next48.1, %vector.body32 ]
  %87 = getelementptr inbounds double, double* %8, i64 %index47
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !17, !noalias !20
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !17, !noalias !20
  %91 = getelementptr inbounds double, double* %10, i64 %index47
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !20
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !20
  %95 = fadd <2 x double> %wide.load55, %wide.load57
  %96 = fadd <2 x double> %wide.load56, %wide.load58
  %97 = bitcast double* %87 to <2 x double>*
  store <2 x double> %95, <2 x double>* %97, align 8, !alias.scope !17, !noalias !20
  %98 = bitcast double* %89 to <2 x double>*
  store <2 x double> %96, <2 x double>* %98, align 8, !alias.scope !17, !noalias !20
  %index.next48 = or i64 %index47, 4
  %99 = getelementptr inbounds double, double* %8, i64 %index.next48
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load55.1 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !17, !noalias !20
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load56.1 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !17, !noalias !20
  %103 = getelementptr inbounds double, double* %10, i64 %index.next48
  %104 = bitcast double* %103 to <2 x double>*
  %wide.load57.1 = load <2 x double>, <2 x double>* %104, align 8, !alias.scope !20
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load58.1 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !20
  %107 = fadd <2 x double> %wide.load55.1, %wide.load57.1
  %108 = fadd <2 x double> %wide.load56.1, %wide.load58.1
  %109 = bitcast double* %99 to <2 x double>*
  store <2 x double> %107, <2 x double>* %109, align 8, !alias.scope !17, !noalias !20
  %110 = bitcast double* %101 to <2 x double>*
  store <2 x double> %108, <2 x double>* %110, align 8, !alias.scope !17, !noalias !20
  %index.next48.1 = add nsw i64 %index47, 8
  %111 = icmp eq i64 %index.next48.1, 2000
  br i1 %111, label %.prol.loopexit..preheader.us.new_crit_edge.preheader.loopexit83, label %vector.body32, !llvm.loop !22

.prol.loopexit..preheader.us.new_crit_edge.preheader.loopexit: ; preds = %._crit_edge69
  br label %.prol.loopexit..preheader.us.new_crit_edge.preheader

.prol.loopexit..preheader.us.new_crit_edge.preheader.loopexit83: ; preds = %vector.body32
  br label %.prol.loopexit..preheader.us.new_crit_edge.preheader

.prol.loopexit..preheader.us.new_crit_edge.preheader: ; preds = %.prol.loopexit..preheader.us.new_crit_edge.preheader.loopexit83, %.prol.loopexit..preheader.us.new_crit_edge.preheader.loopexit
  br label %.prol.loopexit..preheader.us.new_crit_edge

.prol.loopexit..preheader.us.new_crit_edge:       ; preds = %._crit_edge.us, %.prol.loopexit..preheader.us.new_crit_edge.preheader
  %indvars.iv44 = phi i64 [ 0, %.prol.loopexit..preheader.us.new_crit_edge.preheader ], [ %indvars.iv.next45, %._crit_edge.us ]
  %112 = ptrtoint double* %7 to i64
  %sunkaddr67 = shl i64 %indvars.iv44, 3
  %sunkaddr68 = add i64 %112, %sunkaddr67
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to double*
  %.pre70 = load double, double* %sunkaddr69, align 8
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.prol.loopexit..preheader.us.new_crit_edge
  %113 = phi double [ %.pre70, %.prol.loopexit..preheader.us.new_crit_edge ], [ %127, %.preheader.us.new ]
  %indvars.iv = phi i64 [ 0, %.prol.loopexit..preheader.us.new_crit_edge ], [ %indvars.iv.next.1, %.preheader.us.new ]
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv44, i64 %indvars.iv
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, %0
  %117 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = fadd double %113, %119
  %sunkaddr79 = ptrtoint double* %7 to i64
  %sunkaddr80 = mul i64 %indvars.iv44, 8
  %sunkaddr81 = add i64 %sunkaddr79, %sunkaddr80
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to double*
  store double %120, double* %sunkaddr82, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv44, i64 %indvars.iv.next
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, %0
  %124 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %125 = load double, double* %124, align 8
  %126 = fmul double %123, %125
  %127 = fadd double %120, %126
  store double %127, double* %sunkaddr82, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond = icmp eq i64 %indvars.iv.next45, 2000
  br i1 %exitcond, label %.preheader7._crit_edge, label %.prol.loopexit..preheader.us.new_crit_edge

._crit_edge69:                                    ; preds = %._crit_edge69, %._crit_edge69.preheader
  %indvars.iv46 = phi i64 [ 0, %._crit_edge69.preheader ], [ %indvars.iv.next47.4, %._crit_edge69 ]
  %128 = getelementptr inbounds double, double* %8, i64 %indvars.iv46
  %129 = load double, double* %128, align 8
  %130 = getelementptr inbounds double, double* %10, i64 %indvars.iv46
  %131 = load double, double* %130, align 8
  %132 = fadd double %129, %131
  store double %132, double* %128, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %133 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next47
  %134 = load double, double* %133, align 8
  %135 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next47
  %136 = load double, double* %135, align 8
  %137 = fadd double %134, %136
  store double %137, double* %133, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %138 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next47.1
  %139 = load double, double* %138, align 8
  %140 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next47.1
  %141 = load double, double* %140, align 8
  %142 = fadd double %139, %141
  store double %142, double* %138, align 8
  %indvars.iv.next47.2 = add nsw i64 %indvars.iv46, 3
  %143 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next47.2
  %144 = load double, double* %143, align 8
  %145 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next47.2
  %146 = load double, double* %145, align 8
  %147 = fadd double %144, %146
  store double %147, double* %143, align 8
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  %148 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next47.3
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next47.3
  %151 = load double, double* %150, align 8
  %152 = fadd double %149, %151
  store double %152, double* %148, align 8
  %indvars.iv.next47.4 = add nsw i64 %indvars.iv46, 5
  %exitcond1.4 = icmp eq i64 %indvars.iv.next47.4, 2000
  br i1 %exitcond1.4, label %.prol.loopexit..preheader.us.new_crit_edge.preheader.loopexit, label %._crit_edge69, !llvm.loop !23

.preheader7._crit_edge:                           ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %._crit_edge2

; <label>:8:                                      ; preds = %._crit_edge3
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge1, label %._crit_edge3

._crit_edge1:                                     ; preds = %._crit_edge2
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5, !6, !7, !8}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = distinct !{!7, !3}
!8 = distinct !{!8, !3}
!9 = !{!5}
!10 = !{!6}
!11 = !{!7}
!12 = !{!8}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !14, !15}
!23 = distinct !{!23, !14, !15}
