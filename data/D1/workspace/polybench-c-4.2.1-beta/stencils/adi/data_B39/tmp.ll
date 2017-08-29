; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @print_array([1000 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1000 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv16 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next17, %._crit_edge.us ]
  %1 = add nuw nsw i64 %indvars.iv16, 1000
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge ]
  %2 = sub nuw nsw i64 %1, %indvars.iv
  %3 = trunc i64 %2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %6 = sub nuw nsw i64 %1, %indvars.iv.next
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %4, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fdiv <2 x double> %10, <double 1.000000e+03, double 1.000000e+03>
  %12 = bitcast double* %5 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond18, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader152.lr.ph:
  br label %.lr.ph159.split.us.preheader

.lr.ph159.split.us.preheader:                     ; preds = %._crit_edge170, %.preheader152.lr.ph
  %.0171 = phi i32 [ 1, %.preheader152.lr.ph ], [ %146, %._crit_edge170 ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %._crit_edge157.us, %.lr.ph159.split.us.preheader
  %indvar = phi i64 [ %4, %._crit_edge157.us ], [ 0, %.lr.ph159.split.us.preheader ]
  %indvars.iv175 = phi i64 [ %indvars.iv.next176, %._crit_edge157.us ], [ 1, %.lr.ph159.split.us.preheader ]
  %4 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 999
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv175
  store double 1.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv175, i64 0
  store double 0.000000e+00, double* %6, align 8
  %7 = bitcast double* %5 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv175
  %10 = bitcast [1000 x double]* %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = add nsw i64 %indvars.iv175, -1
  %indvars.iv.next176 = add nuw nsw i64 %indvars.iv175, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %12 = add nsw i64 %indvars.iv.lver.orig, -1
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv175, i64 %12
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv175, i64 %indvars.iv.lver.orig
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %11
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next176
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv175, i64 %12
  %.lhs.lver.orig = fmul double %14, 0xC09F400000000001
  %19 = fadd double %.lhs.lver.orig, 0x40AF420000000001
  %20 = fdiv double 0x409F400000000001, %19
  store double %20, double* %15, align 8
  %21 = bitcast double* %16 to <2 x double>*
  %22 = load <2 x double>, <2 x double>* %21, align 8
  %23 = fmul <2 x double> %22, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %26 = fsub double %25, %24
  %27 = load double, double* %17, align 8
  %28 = fmul double %27, 0xC08F400000000001
  %29 = fsub double %26, %28
  %30 = load double, double* %18, align 8
  %31 = fmul double %30, 0xC09F400000000001
  %32 = fsub double %29, %31
  %33 = fdiv double %32, %19
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv175, i64 %indvars.iv.lver.orig
  store double %33, double* %34, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.lr.ph156.us.preheader.loopexit, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial10 = load double, double* %scevgep4, align 8
  br label %._crit_edge

._crit_edge157.us:                                ; preds = %.lr.ph156.us
  %exitcond177 = icmp eq i64 %indvars.iv.next176, 999
  br i1 %exitcond177, label %._crit_edge187.lver.check.preheader, label %._crit_edge.lver.check

._crit_edge187.lver.check.preheader:              ; preds = %._crit_edge157.us
  br label %._crit_edge187.lver.check

.lr.ph156.us:                                     ; preds = %.lr.ph156.us, %.lr.ph156.us.preheader
  %indvars.iv173 = phi i64 [ 998, %.lr.ph156.us.preheader ], [ %indvars.iv.next174.1, %.lr.ph156.us ]
  %35 = phi double [ 1.000000e+00, %.lr.ph156.us.preheader ], [ %48, %.lr.ph156.us ]
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv175, i64 %indvars.iv173
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %35
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv175, i64 %indvars.iv173
  %40 = load double, double* %39, align 8
  %41 = fadd double %38, %40
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv173, i64 %indvars.iv175
  store double %41, double* %42, align 8
  %indvars.iv.next174 = add nsw i64 %indvars.iv173, -1
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv175, i64 %indvars.iv.next174
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %41
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv175, i64 %indvars.iv.next174
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next174, i64 %indvars.iv175
  store double %48, double* %49, align 8
  %50 = icmp sgt i64 %indvars.iv.next174, 1
  %indvars.iv.next174.1 = add nsw i64 %indvars.iv173, -2
  br i1 %50, label %.lr.ph156.us, label %._crit_edge157.us

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded11 = phi double [ %load_initial10, %._crit_edge.ph ], [ %67, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %55, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge ]
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv175, i64 %indvars.iv
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %11
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next176
  %.lhs = fmul double %store_forwarded, 0xC09F400000000001
  %54 = fadd double %.lhs, 0x40AF420000000001
  %55 = fdiv double 0x409F400000000001, %54
  store double %55, double* %51, align 8
  %56 = bitcast double* %52 to <2 x double>*
  %57 = load <2 x double>, <2 x double>* %56, align 8
  %58 = fmul <2 x double> %57, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %59 = extractelement <2 x double> %58, i32 0
  %60 = extractelement <2 x double> %58, i32 1
  %61 = fsub double %60, %59
  %62 = load double, double* %53, align 8
  %63 = fmul double %62, 0xC08F400000000001
  %64 = fsub double %61, %63
  %65 = fmul double %store_forwarded11, 0xC09F400000000001
  %66 = fsub double %64, %65
  %67 = fdiv double %66, %54
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv175, i64 %indvars.iv
  store double %67, double* %68, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %.lr.ph156.us.preheader.loopexit35, label %._crit_edge

.lr.ph156.us.preheader.loopexit:                  ; preds = %._crit_edge.lver.orig
  br label %.lr.ph156.us.preheader

.lr.ph156.us.preheader.loopexit35:                ; preds = %._crit_edge
  br label %.lr.ph156.us.preheader

.lr.ph156.us.preheader:                           ; preds = %.lr.ph156.us.preheader.loopexit35, %.lr.ph156.us.preheader.loopexit
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv175
  store double 1.000000e+00, double* %69, align 8
  br label %.lr.ph156.us

._crit_edge187.lver.check:                        ; preds = %._crit_edge187.lver.check.preheader, %._crit_edge167.us
  %indvar12 = phi i64 [ %70, %._crit_edge167.us ], [ 0, %._crit_edge187.lver.check.preheader ]
  %indvars.iv183 = phi i64 [ %indvars.iv.next184, %._crit_edge167.us ], [ 1, %._crit_edge187.lver.check.preheader ]
  %70 = add i64 %indvar12, 1
  %scevgep14 = getelementptr [1000 x double], [1000 x double]* %2, i64 %70, i64 0
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %2, i64 %70, i64 999
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %3, i64 %70, i64 0
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %3, i64 %70, i64 999
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv183, i64 0
  store double 1.000000e+00, double* %71, align 8
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv183, i64 0
  store double 0.000000e+00, double* %72, align 8
  %73 = bitcast double* %71 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv183
  %76 = bitcast [1000 x double]* %75 to i64*
  store i64 %74, i64* %76, align 8
  %77 = add nsw i64 %indvars.iv183, -1
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %bound022 = icmp ult double* %scevgep14, %scevgep20
  %bound123 = icmp ult double* %scevgep18, %scevgep16
  %memcheck.conflict25 = and i1 %bound022, %bound123
  br i1 %memcheck.conflict25, label %._crit_edge187.lver.orig.preheader, label %._crit_edge187.ph

._crit_edge187.lver.orig.preheader:               ; preds = %._crit_edge187.lver.check
  br label %._crit_edge187.lver.orig

._crit_edge187.lver.orig:                         ; preds = %._crit_edge187.lver.orig.preheader, %._crit_edge187.lver.orig
  %indvars.iv178.lver.orig = phi i64 [ %indvars.iv.next179.lver.orig, %._crit_edge187.lver.orig ], [ 1, %._crit_edge187.lver.orig.preheader ]
  %78 = add nsw i64 %indvars.iv178.lver.orig, -1
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv183, i64 %78
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv183, i64 %indvars.iv178.lver.orig
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %77, i64 %indvars.iv178.lver.orig
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv183, i64 %indvars.iv178.lver.orig
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next184, i64 %indvars.iv178.lver.orig
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv183, i64 %78
  %86 = insertelement <2 x double> undef, double %80, i32 0
  %87 = shufflevector <2 x double> %86, <2 x double> undef, <2 x i32> zeroinitializer
  %88 = fmul <2 x double> %87, <double 0xC08F400000000001, double 0xC08F400000000001>
  %89 = fadd <2 x double> %88, <double 0x409F440000000001, double 0x409F440000000001>
  %90 = extractelement <2 x double> %89, i32 0
  %91 = extractelement <2 x double> %89, i32 1
  %92 = fdiv double 0x408F400000000001, %90
  store double %92, double* %81, align 8
  %93 = load double, double* %82, align 8
  %94 = fmul double %93, 0xC09F400000000001
  %95 = load double, double* %83, align 8
  %96 = fmul double %95, 0xC0AF3E0000000001
  %97 = fsub double %96, %94
  %98 = load double, double* %84, align 8
  %99 = fmul double %98, 0xC09F400000000001
  %100 = fsub double %97, %99
  %101 = load double, double* %85, align 8
  %102 = fmul double %101, 0xC08F400000000001
  %103 = fsub double %100, %102
  %104 = fdiv double %103, %91
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv183, i64 %indvars.iv178.lver.orig
  store double %104, double* %105, align 8
  %indvars.iv.next179.lver.orig = add nuw nsw i64 %indvars.iv178.lver.orig, 1
  %exitcond180.lver.orig = icmp eq i64 %indvars.iv.next179.lver.orig, 999
  br i1 %exitcond180.lver.orig, label %.lr.ph166.us.preheader.loopexit, label %._crit_edge187.lver.orig

._crit_edge187.ph:                                ; preds = %._crit_edge187.lver.check
  %load_initial27 = load double, double* %scevgep14, align 8
  %load_initial30 = load double, double* %scevgep18, align 8
  br label %._crit_edge187

._crit_edge167.us:                                ; preds = %.lr.ph166.us
  %exitcond185 = icmp eq i64 %indvars.iv.next184, 999
  br i1 %exitcond185, label %._crit_edge170, label %._crit_edge187.lver.check

.lr.ph166.us:                                     ; preds = %.lr.ph166.us, %.lr.ph166.us.preheader
  %indvars.iv181 = phi i64 [ 998, %.lr.ph166.us.preheader ], [ %indvars.iv.next182.1, %.lr.ph166.us ]
  %106 = phi double [ 1.000000e+00, %.lr.ph166.us.preheader ], [ %119, %.lr.ph166.us ]
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv183, i64 %indvars.iv181
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, %106
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv183, i64 %indvars.iv181
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv181
  store double %112, double* %113, align 8
  %indvars.iv.next182 = add nsw i64 %indvars.iv181, -1
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv183, i64 %indvars.iv.next182
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, %112
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv183, i64 %indvars.iv.next182
  %118 = load double, double* %117, align 8
  %119 = fadd double %116, %118
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv.next182
  store double %119, double* %120, align 8
  %121 = icmp sgt i64 %indvars.iv.next182, 1
  %indvars.iv.next182.1 = add nsw i64 %indvars.iv181, -2
  br i1 %121, label %.lr.ph166.us, label %._crit_edge167.us

._crit_edge187:                                   ; preds = %._crit_edge187, %._crit_edge187.ph
  %store_forwarded31 = phi double [ %load_initial30, %._crit_edge187.ph ], [ %143, %._crit_edge187 ]
  %store_forwarded28 = phi double [ %load_initial27, %._crit_edge187.ph ], [ %132, %._crit_edge187 ]
  %indvars.iv178 = phi i64 [ 1, %._crit_edge187.ph ], [ %indvars.iv.next179, %._crit_edge187 ]
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv183, i64 %indvars.iv178
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %77, i64 %indvars.iv178
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv183, i64 %indvars.iv178
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next184, i64 %indvars.iv178
  %126 = insertelement <2 x double> undef, double %store_forwarded28, i32 0
  %127 = shufflevector <2 x double> %126, <2 x double> undef, <2 x i32> zeroinitializer
  %128 = fmul <2 x double> %127, <double 0xC08F400000000001, double 0xC08F400000000001>
  %129 = fadd <2 x double> %128, <double 0x409F440000000001, double 0x409F440000000001>
  %130 = extractelement <2 x double> %129, i32 0
  %131 = extractelement <2 x double> %129, i32 1
  %132 = fdiv double 0x408F400000000001, %130
  store double %132, double* %122, align 8
  %133 = load double, double* %123, align 8
  %134 = fmul double %133, 0xC09F400000000001
  %135 = load double, double* %124, align 8
  %136 = fmul double %135, 0xC0AF3E0000000001
  %137 = fsub double %136, %134
  %138 = load double, double* %125, align 8
  %139 = fmul double %138, 0xC09F400000000001
  %140 = fsub double %137, %139
  %141 = fmul double %store_forwarded31, 0xC08F400000000001
  %142 = fsub double %140, %141
  %143 = fdiv double %142, %131
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv183, i64 %indvars.iv178
  store double %143, double* %144, align 8
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %exitcond180 = icmp eq i64 %indvars.iv.next179, 999
  br i1 %exitcond180, label %.lr.ph166.us.preheader.loopexit34, label %._crit_edge187

.lr.ph166.us.preheader.loopexit:                  ; preds = %._crit_edge187.lver.orig
  br label %.lr.ph166.us.preheader

.lr.ph166.us.preheader.loopexit34:                ; preds = %._crit_edge187
  br label %.lr.ph166.us.preheader

.lr.ph166.us.preheader:                           ; preds = %.lr.ph166.us.preheader.loopexit34, %.lr.ph166.us.preheader.loopexit
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv183, i64 999
  store double 1.000000e+00, double* %145, align 8
  br label %.lr.ph166.us

._crit_edge170:                                   ; preds = %._crit_edge167.us
  %146 = add nuw nsw i32 %.0171, 1
  %exitcond186 = icmp eq i32 %146, 501
  br i1 %exitcond186, label %._crit_edge172, label %.lr.ph159.split.us.preheader

._crit_edge172:                                   ; preds = %._crit_edge170
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv15, 1000
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge18
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge18

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
